#!/usr/bin/env node
'use strict';

const templates = require('../templates.js');
const datapathTemplates = require('../datapath-templates');
const path = require('path');
const fs = require('fs-extra');
const fhyper = require('reqack/lib/fhyper');
const fhyperDot = require('reqack/lib/fhyper-dot');
const fhyperV = require('reqack/lib/fhyper-verilog');
const k15_op = require('../lib/k15_op');
const piston = require('../lib/piston');
const macros = require('../lib/macros');
const macrosDatapath = require('../../../datapath/lib/datapath-macros');
const allMacros = Object.assign({}, macros, macrosDatapath);

const constants = require('../lib/constants');
//console.log(constants);

const props = {
    iAddrWidth: 16,
    oAddrWidth: 11+constants.divlog2,
    inputs: 4,
    outputs: 32,
    dataWidth: 32,
    dmaOutStages: 3,
    law: {
        inmux: [1, 5, 7],
	inmuxReal: [1, 13, 15],
        oumux: [8, 9, 13, 14, 15],
        selin: 4,
        selou: 4,
        perin: 5-constants.divlog2,
        perou: 5-constants.divlog2,
        baddr: 11+constants.divlog2,
	saddr: 16,
        k15: 32
    },
    
    slices: 32/constants.div,
    log2slices: Math.log2(32/constants.div),

    funnel: {
        minWidth: 4, // 4x18-bit outputs
        maxWidth: 16, // 16x18-bit outputs
        steps: 3 // 64:4 64:8 64:16
    },
    cfg: [
        8, 8, 8, 8, 8, 8, 8, 8, // bs
        8, 8, 8 // funnel funnel defunnel
    ]
};

const fineGrain = {
    'inmux_dat.v':[[4,1]],
    'oumux_dat.v':[[2,5]],
    'iperm_dat.v':[[2,1]],
    'operm_dat.v':[[2,1]],
    'kap_ctrl_dat.v':[[1,5]],
    'rdp_systolic_dat.v':[[5,2]],
    'vector_dat.v':[[props.slices+1,2]],
    'vmem_dat.v':[[6,5]],
    'ka_decode_dat.v':[[1,3]],
    'p_decode_dat.v':[[1,2]],

    'inmux_ctrl.v':[[4,1]],
    'oumux_ctrl.v':[[2,5]],
    'iperm_ctrl.v':[[2,1]],
    'operm_ctrl.v':[[2,1]],
    'kap_ctrl_ctrl.v':[[1,5]],
    'rdp_systolic_ctrl.v':[[5,2]],
    'vector_ctrl.v':[[props.slices+1,2]],
    'vmem_ctrl.v':[[6,5]],
    'ka_decode_ctrl.v':[[1,3]],
    'p_decode_ctrl.v':[[1,2]],

    'bs_dat.v': [[2, 1]],
    'round_sat_dat.v' : [[1,1]],

    'funnel_dat.v':    [[2, 1], [2, 2], [2, 4]],
    'funnel_ctrl.v':   [[2, 1], [2, 2], [2, 4]],

    'defunnel_dat.v':  [[2, 1], [3, 1], [5, 1]],
    'defunnel_ctrl.v': [[2, 1], [3, 1], [5, 1]]
}

const allTemplates = Object.assign({},templates,datapathTemplates);

Object.keys(allTemplates).forEach(fileName => {
    const extName = path.extname(fileName);
    const baseName = path.basename(fileName, extName);
    (fineGrain[fileName] || [[]]).forEach(subUnit => {
        const body = allTemplates[fileName](Object.assign({local: subUnit}, props));
        const outPath = path.resolve(process.cwd(), 'hdl', baseName + subUnit.map(e => '_' + e).join('') + extName);
        fs.outputFile(
            outPath,
            body,
            'utf-8',
            function (err) { if (err) { throw err; } }
        );
    });
});

// elastic piston
const g = fhyper('piston');
piston(g)();
let vmemH;
g.nodes.map((n,ni) => {
    if(n.label === 'vmem') {
	vmemH = '#define UNODE_NAME ' + ni + '\n' + '#define VMEM_INPUTS ' + fineGrain['vmem_dat.v'][0][0] + '\n' + '#define VMEM_OUTPUTS ' + fineGrain['vmem_dat.v'][0][1] + '\n';
    }
});
fs.outputFile('c/vmem_node.h',vmemH, () => {});

fs.outputFile('hdl/piston.dot', fhyperDot(g), () => {
    fs.outputFile('hdl/piston.v', fhyperV(g, allMacros),   () => {});
});

const k15 = fhyper('k15_op');
k15_op(k15)();
fs.outputFile('hdl/k15_op.dot', fhyperDot(k15), () => {
    fs.outputFile('hdl/k15_op.v', fhyperV(k15, allMacros),   () => {});
});
