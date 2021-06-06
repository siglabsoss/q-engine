// transpiled from: ../../datapath/templates/

var __f0 = function (obj) {
obj || (obj = {});
var __t, __p = '', __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    const range = require('lodash.range');
    const layers = 5;
;
__p += '\nmodule bs_dat_' +
((__t = (local.join('_'))) == null ? '' : __t) +
' #(\n    parameter T_0_DAT_WIDTH = 36,\n    parameter I_0_DAT_WIDTH = 20\n) (\n    input        [T_0_DAT_WIDTH - 1 : 0] t_0_dat,\n    input         [7:0] t_cfg_dat,\n    output wire [I_0_DAT_WIDTH - 1 : 0] i_0_dat,\n    input clk, reset_n\n);\n\n// Data processing\nwire    [15:0] shift_data;   // shifted data\nreg           pre_sat;      // preliminary saturation detection\nreg           round_flag;   // rounding detection\n\nwire  t_0_dat_sign;\nassign t_0_dat_sign = t_0_dat[T_0_DAT_WIDTH-1];\n\nwire  negative_flag; // if the number is negative and the saturation is positive\nassign negative_flag = t_cfg_dat[6] & t_0_dat_sign;\n\nassign shift_data = $signed(t_0_dat) >> t_cfg_dat[5:0];\n\nalways @*\n    casez(t_cfg_dat[5:0])\n';
 range(20).map(i => { ;
__p += '\n        ' +
((__t = (i)) == null ? '' : __t) +
'    : pre_sat = ( ((t_0_dat[35:' +
((__t = (15 + i)) == null ? '' : __t) +
'] == 0) || (t_0_dat[35:' +
((__t = (15 + i)) == null ? '' : __t) +
'] == {' +
((__t = (21 - i)) == null ? '' : __t) +
'{1\'b1}})) ? 1\'b0 : 1\'b1 );';
 }) ;
__p += '\n        20-39 : pre_sat = 1\'b0; // No saturation is possible becase of most significant part is in use\n        default pre_sat = 1\'bx; // Incorrect/unsupported control value\n    endcase\n\n// Rounding detection\nalways @*\n    casez(t_cfg_dat[5:0])\n        0     : round_flag = 1\'b0;\n';
 range(34).map(i => { ;
__p += '\n        ' +
((__t = (i + 1)) == null ? '' : __t) +
'     : round_flag = t_0_dat[' +
((__t = (i)) == null ? '' : __t) +
'];';
 }) ;
__p += '\n        35    : round_flag = 1\'b0;\n        default round_flag = 1\'bx; // Incorrect/unsupported control value\n    endcase\n\n   assign i_0_dat = {negative_flag,pre_sat,round_flag,t_0_dat_sign,shift_data};\n   \n   \nendmodule\n';

}
return __p
};

var __f2 = function (obj) {
obj || (obj = {});
var __t, __p = '', __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    const range = require('lodash.range');
    const dim = (n) => `[${n - 1}:0]`;
    const slice = (n, offset) => {
        if (offset) {
            return `[${n + offset - 1}:${offset}]`;
        }
        return `[${n - 1}:0]`;
    };
;
__p += '\n\nmodule cfg_dat_' +
((__t = (local.join('_'))) == null ? '' : __t) +
' (\n    input        ' +
((__t = ( dim(slices * dataWidth) )) == null ? '' : __t) +
' t_0_dat,\n';
 cfg.map((width, index) => { ;
__p += '\n    output       ' +
((__t = ( dim(width) )) == null ? '' : __t) +
' i_' +
((__t = (index)) == null ? '' : __t) +
'_dat,\n';
 }) ;
__p += '\n    input clk, reset_n\n);\n\nassign {' +
((__t = ( range(cfg.length).map(index => 'i_' + index + '_dat').join(', ') )) == null ? '' : __t) +
'} = t_0_dat;\n\nendmodule\n';

}
return __p
};

var __f1 = function (obj) {
obj || (obj = {});
var __t, __p = '', __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    const range = require('lodash.range');
    const dim = (n) => `[${n - 1}:0]`;
    const slice = (n, offset) => {
        if (offset) {
            return `[${n + offset - 1}:${offset}]`;
        }
        return `[${n - 1}:0]`;
    };
;
__p += '\n\nmodule cfg_ctrl_' +
((__t = (local.join('_'))) == null ? '' : __t) +
' (\n';
 range(local[0]).map(index => { ;
__p += '\n    input        t_' +
((__t = (index)) == null ? '' : __t) +
'_req,\n    output       t_' +
((__t = (index)) == null ? '' : __t) +
'_ack,\n';
 }) ;
__p += '\n';
 range(local[1]).map(index => { ;
__p += '\n    output       i_' +
((__t = (index)) == null ? '' : __t) +
'_req,\n    input        i_' +
((__t = (index)) == null ? '' : __t) +
'_ack,\n';
 }) ;
__p += '\n    input clk, reset_n\n);\n\nendmodule\n';

}
return __p
};

var __f5 = function (obj) {
obj || (obj = {});
var __t, __p = '', __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    const range = require('lodash.range');

    const dim = (n) => `[${n - 1}:0]`;

    const slice = (n, offset) => {
        if (offset) {
            return `[${n + offset - 1}:${offset}]`;
        }
        return `[${n - 1}:0]`;
    };


    const radix = 4;
    const chunkW = radix * 2 * 16;

    const targets = obj.local[0];
    const initiators = obj.local[1];

    const chunks = 2 * initiators;
    const initiatorWidth = chunkW;
    const targetWidth = chunks * initiatorWidth;

    const steps = Math.log2(chunks);
;
__p += '\n\nmodule funnel_ctrl_' +
((__t = (local.join('_'))) == null ? '' : __t) +
' (\n    input        t_0_req,\n    output       t_0_ack,\n    input        t_cfg_req,\n    output       t_cfg_ack,\n';
 range(initiators).map(index => { ;
__p += '\n    output       i_' +
((__t = (index)) == null ? '' : __t) +
'_req,\n    input        i_' +
((__t = (index)) == null ? '' : __t) +
'_ack,\n';
 }) ;
__p += '\n    output       ' +
((__t = ( dim(8) )) == null ? '' : __t) +
' sel,\n    input        ' +
((__t = ( dim(8) )) == null ? '' : __t) +
' mode,\n    input clk, reset_n\n);\n\n// 8:4\n// reduct   state    sel    req0    req1    req2    req3\n// 4        0        000    req     req     req     req\n// 4        4        001    req     req     req     req\n\n// 8:2\n// reduct   state    sel    req0    req1    req2    req3\n// 2        0        000    req     req     0       0\n// 2        2        010    req     req     0       0\n// 2        4        001    req     req     0       0\n// 2        6        011    req     req     0       0\n\n// 8:1\n// reduct   state    sel    req0    req1    req2    req3\n// 1        0        000    req     0       0       0\n// 1        1        100    req     0       0       0\n// 1        2        010    req     0       0       0\n// 1        3        110    req     0       0       0\n// 1        4        001    req     0       0       0\n// 1        5        101    req     0       0       0\n// 1        6        011    req     0       0       0\n// 1        7        111    req     0       0       0\n\nwire ' +
((__t = ( dim(steps) )) == null ? '' : __t) +
' reduct; assign reduct = mode' +
((__t = ( dim(steps) )) == null ? '' : __t) +
';\n\nwire progress; assign progress = (';
  range(steps).map(index => { ;
__p += '\n    reduct[' +
((__t = (index)) == null ? '' : __t) +
'] ? (t_0_req & ' +
((__t = ( range(1 << index).map(j => `i_${j}_ack`).join(' & ') )) == null ? '' : __t) +
') :';
 }); ;
__p += '\n    1\'b0\n);\n\nreg ' +
((__t = ( dim(steps) )) == null ? '' : __t) +
' state;\nwire ' +
((__t = ( dim(steps) )) == null ? '' : __t) +
' state_nxt; assign state_nxt = state + reduct;\n\nalways @(posedge clk or negedge reset_n)\n    if (~reset_n)      state <= ' +
((__t = ( steps )) == null ? '' : __t) +
'\'b0;\n    else if (progress) state <= state_nxt;\n\nwire last; assign last = (state_nxt == ' +
((__t = ( steps )) == null ? '' : __t) +
'\'b0);\n\nassign t_0_ack = last & (';
  range(steps).map(index => { ;
__p += '\n    reduct[' +
((__t = (index)) == null ? '' : __t) +
'] ? (' +
((__t = ( range(1 << index).map(j => `i_${j}_ack`).join(' & ') )) == null ? '' : __t) +
') :';
 }); ;
__p += '\n    1\'b0\n);\n\nassign sel = {' +
((__t = ( range(steps).map(index => `state[${index}]`).join(', ') )) == null ? '' : __t) +
'}; // reverse order\n\n';

    range(initiators).map(index => {
        let reduct = [];
        range(steps).reverse().map(i => (index >>> i) & 1).some((bit, i) => {
            if (bit === 0) reduct.push(steps - i - 1);
            return bit;
        });
;
__p += '\nassign i_' +
((__t = (index)) == null ? '' : __t) +
'_req = t_0_req & ' +
((__t = ( reduct.map(index => `reduct[${index}]`).join(' | ') )) == null ? '' : __t) +
';';
 }); ;
__p += '\n\nassign t_cfg_ack = 1\'b1;\n\nendmodule\n';

}
return __p
};

var __f7 = function (obj) {
obj || (obj = {});
var __t, __p = '', __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    const range = require('lodash.range');
    const layers = 5;
;
__p += '\nmodule round_sat_dat_' +
((__t = (local.join('_'))) == null ? '' : __t) +
' #(\n    parameter T_0_DAT_WIDTH = 20,\n    parameter I_0_DAT_WIDTH = 16\n) (\n    input        [T_0_DAT_WIDTH - 1 : 0] t_0_dat,\n    output reg [I_0_DAT_WIDTH - 1 : 0] i_0_dat,\n    input clk, reset_n\n);\n\n// Data processing\nwire    [15:0] shift_data;   // shifted data\nwire           pre_sat;      // preliminary saturation detection\nwire           round_flag;   // rounding detection\nwire    [16:0] rounded_data; // rounded data\n\n\nwire  t_0_dat_sign;\nassign t_0_dat_sign = t_0_dat[T_0_DAT_WIDTH-4];\n\nwire  negative_flag; // if the number is negative and the saturation is positive\nassign negative_flag = t_0_dat[T_0_DAT_WIDTH-1];\n\nassign shift_data = t_0_dat[T_0_DAT_WIDTH-5:0];\n\nassign pre_sat = t_0_dat[T_0_DAT_WIDTH-2];\n\nassign round_flag = t_0_dat[T_0_DAT_WIDTH-3];\n\n// Rounding process\nassign rounded_data = {shift_data[15], shift_data} + { 16\'h0000, round_flag};\n\n// Saturation process\nalways @*\n    if(negative_flag)\n        i_0_dat = 0;\n    else\n        if ((pre_sat == 1\'b1) || (rounded_data[16] != rounded_data[15]))\n            i_0_dat = { {I_0_DAT_WIDTH - 15{t_0_dat_sign}}, {15{~t_0_dat_sign}} };\n        else\n            i_0_dat = { {I_0_DAT_WIDTH - 16{rounded_data[15]}}, rounded_data[15:0]};\n   \n\nendmodule\n';

}
return __p
};

var __f3 = function (obj) {
obj || (obj = {});
var __t, __p = '', __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    const range = require('lodash.range');

    const dim = (n) => `[${n - 1}:0]`;

    const slice = (n, offset) => {
        if (offset) {
            return `[${n + offset - 1}:${offset}]`;
        }
        return `[${n - 1}:0]`;
    };


    const radix = 4;
    const perChunk = 2 * radix;
    const chunkW = perChunk * 16;

    const targets = obj.local[0];
    const initiators = obj.local[1];

    const maxChunks = targets - 1;

    const chunks = 2 * maxChunks;
    const narrowWidth = chunkW;
    const wideWidth = chunks * narrowWidth;

    const steps = Math.log2(chunks);
;
__p += '\n\nmodule defunnel_ctrl_' +
((__t = (local.join('_'))) == null ? '' : __t) +
' (\n\n';
 range(maxChunks).map(index => { ;
__p += '\n    input        t_' +
((__t = (index)) == null ? '' : __t) +
'_req,\n    output       t_' +
((__t = (index)) == null ? '' : __t) +
'_ack,\n';
 }) ;
__p += '\n    input        t_cfg_req,\n    output       t_cfg_ack,\n';
 [0].map(index => { ;
__p += '\n    output       i_' +
((__t = (index)) == null ? '' : __t) +
'_req,\n    input        i_' +
((__t = (index)) == null ? '' : __t) +
'_ack,\n';
 }) ;
__p += '\n    output       ' +
((__t = ( dim(8) )) == null ? '' : __t) +
' enable,\n    input        ' +
((__t = ( dim(8) )) == null ? '' : __t) +
' mode,\n    input clk, reset_n\n);\n\nwire ' +
((__t = ( dim(steps) )) == null ? '' : __t) +
' reduct; assign reduct = mode' +
((__t = ( dim(steps) )) == null ? '' : __t) +
';\n\nwire t_req; assign t_req = (';
  range(steps).map(index => { ;
__p += '\n    reduct[' +
((__t = (index)) == null ? '' : __t) +
'] ? (' +
((__t = ( range(1 << index).map(j => `t_${j}_req`).join(' & ') )) == null ? '' : __t) +
') :';
 }); ;
__p += '\n    1\'b0\n);\n\nreg ' +
((__t = ( dim(chunks) )) == null ? '' : __t) +
' valid;\nwire ' +
((__t = ( dim(chunks) )) == null ? '' : __t) +
' valid_nxt; // data valid bit\n\nwire t_ack; assign t_ack = i_0_ack | (~&valid);\n\nwire progress; assign progress = t_req & ((~&valid) | (&valid & i_0_ack));\n\nreg ' +
((__t = ( dim(steps) )) == null ? '' : __t) +
' state;\nwire ' +
((__t = ( dim(steps) )) == null ? '' : __t) +
' state_nxt; assign state_nxt = state + reduct;\n\nassign valid_nxt = ((i_0_ack & (state === \'b0)) ? ' +
((__t = (chunks)) == null ? '' : __t) +
'\'b0 : valid) | enable' +
((__t = ( dim(chunks) )) == null ? '' : __t) +
';\n\nalways @(posedge clk or negedge reset_n)\n    if (~reset_n)      state <= ' +
((__t = ( steps )) == null ? '' : __t) +
'\'b0;\n    else if (progress) state <= state_nxt;\n\nalways @(posedge clk or negedge reset_n)\n    if (~reset_n) valid <= ' +
((__t = (chunks)) == null ? '' : __t) +
'\'b0;\n    else          valid <= valid_nxt;\n\n\nassign enable = {' +
((__t = (chunks)) == null ? '' : __t) +
'{progress}} & (';
  range(steps).map(index => { ;
__p += '\n    reduct[' +
((__t = (index)) == null ? '' : __t) +
'] ? (' +
((__t = ( 1 << index )) == null ? '' : __t) +
'\'b' +
((__t = ( '1'.repeat(index + 1) )) == null ? '' : __t) +
' << state):';
 }); ;
__p += '\n    1\'b0\n);\n\n';
 range(maxChunks).map(index => { ;
__p += '\nassign t_' +
((__t = (index)) == null ? '' : __t) +
'_ack = t_req & (';

    range(steps).reverse().some(step => {
        if ((index >> step) & 1) { return 1; }
;
__p += '\n    reduct[' +
((__t = ( step )) == null ? '' : __t) +
'] ? t_ack :';
 }) ;
__p += '\n    1\'b1\n);\n';
 }); ;
__p += '\n\nassign t_cfg_ack = 1\'b1;\n\nassign i_0_req = &valid;\n\nendmodule\n';

}
return __p
};

var __f4 = function (obj) {
obj || (obj = {});
var __t, __p = '', __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    const range = require('lodash.range');

    const dim = (n) => `[${n - 1}:0]`;

    const slice = (n, offset) => {
        if (offset) {
            return `[${n + offset - 1}:${offset}]`;
        }
        return `[${n - 1}:0]`;
    };


    const radix = 4;
    const perChunk = 2 * radix;
    const chunkW = perChunk * 16;

    const targets = obj.local[0];
    const initiators = obj.local[1];

    const maxChunks = targets - 1;

    const chunks = 2 * maxChunks;
    const narrowWidth = chunkW;
    const wideWidth = chunks * narrowWidth;

    const steps = Math.log2(chunks);
;
__p += '\n\n// ' +
((__t = (maxChunks)) == null ? '' : __t) +
'\n\nmodule defunnel_dat_' +
((__t = (local.join('_'))) == null ? '' : __t) +
' (\n';
 range(maxChunks).map(index => { ;
__p += '\n    input        ' +
((__t = ( dim(narrowWidth) )) == null ? '' : __t) +
' t_' +
((__t = (index)) == null ? '' : __t) +
'_dat,';
 }) ;
__p += '\n    input        ' +
((__t = ( dim(8) )) == null ? '' : __t) +
' t_cfg_dat, // config\n    output       ' +
((__t = ( dim(wideWidth) )) == null ? '' : __t) +
' i_0_dat,\n    input        ' +
((__t = ( dim(8) )) == null ? '' : __t) +
' enable,\n    output       ' +
((__t = ( dim(8) )) == null ? '' : __t) +
' mode,\n    input clk, reset_n\n);\n\nassign mode = t_cfg_dat;\n\nwire ' +
((__t = ( dim(steps) )) == null ? '' : __t) +
' reduct; assign reduct = mode' +
((__t = ( dim(steps) )) == null ? '' : __t) +
';\n\n// form reduct  sel\n// 4:8  4       011\n// 2:8  2       001\n// 1:8  1       000\n\nwire ' +
((__t = ( dim(steps) )) == null ? '' : __t) +
' sel; assign sel = reduct - ' +
((__t = ( steps )) == null ? '' : __t) +
'\'b1;\n\n';

    [0]
        .map(layer => {
            range(chunks)
                .map(subset => {
;
__p += '\nwire ' +
((__t = ( dim(chunkW) )) == null ? '' : __t) +
' dat' +
((__t = (layer)) == null ? '' : __t) +
'_' +
((__t = (subset)) == null ? '' : __t) +
'; assign dat' +
((__t = (layer)) == null ? '' : __t) +
'_' +
((__t = (subset)) == null ? '' : __t) +
' = ' +
((__t = (
                    (subset >= maxChunks) ? 0 : 't_' + subset + '_dat' )) == null ? '' : __t) +
';';

                })
        })
;
__p += '\n\n';

    range(steps)
        .map(layer => {
            range(chunks)
                .map(subset => {
;
__p += '\nwire ' +
((__t = ( dim(chunkW) )) == null ? '' : __t) +
' dat' +
((__t = (layer + 1)) == null ? '' : __t) +
'_' +
((__t = (subset)) == null ? '' : __t) +
'; assign dat' +
((__t = (layer + 1)) == null ? '' : __t) +
'_' +
((__t = (subset)) == null ? '' : __t) +
' = ' +
((__t = (
                ((subset >> layer) === 1)
                    ? 'sel[' + layer + '] ? ' +
                        'dat' + layer + '_' + subset +
                        ' : ' +
                        'dat' + layer + '_' + (subset - (1 << layer))
                    : 'dat' + layer + '_' + subset

)) == null ? '' : __t) +
';';

            })
        })
;
__p += '\n\n\n// final flops\n';
 range(chunks).map(i => { ;
__p += '\nreg ' +
((__t = ( dim(chunkW) )) == null ? '' : __t) +
' dat' +
((__t = (i)) == null ? '' : __t) +
'; always @(posedge clk) if (enable[' +
((__t = (i)) == null ? '' : __t) +
']) dat' +
((__t = (i)) == null ? '' : __t) +
' <= dat' +
((__t = (steps)) == null ? '' : __t) +
'_' +
((__t = (i)) == null ? '' : __t) +
';';
 }) ;
__p += '\n//\n\n// final concatination\nassign i_0_dat = {' +
((__t = ( range(chunks).reverse().map(i => 'dat' + i).join(', ') )) == null ? '' : __t) +
'};\n\nendmodule\n';

}
return __p
};

var __f6 = function (obj) {
obj || (obj = {});
var __t, __p = '', __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    const range = require('lodash.range');

    const dim = (n) => `[${n - 1}:0]`;

    const slice = (n, offset) => {
        if (offset) {
            return `[${n + offset - 1}:${offset}]`;
        }
        return `[${n - 1}:0]`;
    };


    const radix = 4;
    const chunkW = radix * 2 * 16;

    const targets = obj.local[0];
    const initiators = obj.local[1];

    const chunks = 2 * initiators;
    const narrowWidth = chunkW;
    const wideWidth = chunks * narrowWidth;

    const steps = Math.log2(chunks);
;
__p += '\n\nmodule funnel_dat_' +
((__t = (local.join('_'))) == null ? '' : __t) +
' (\n    input        ' +
((__t = ( dim(wideWidth) )) == null ? '' : __t) +
' t_0_dat,\n    input        ' +
((__t = ( dim(8) )) == null ? '' : __t) +
' t_cfg_dat, // config\n';
 range(initiators).map(index => { ;
__p += '\n    output       ' +
((__t = ( dim(narrowWidth) )) == null ? '' : __t) +
' i_' +
((__t = (index)) == null ? '' : __t) +
'_dat,';
 }) ;
__p += '\n    input        ' +
((__t = ( dim(8) )) == null ? '' : __t) +
' sel,\n    output       ' +
((__t = ( dim(8) )) == null ? '' : __t) +
' mode,\n    input clk, reset_n\n);\n\n// controller\nassign mode = t_cfg_dat;\n\n// initial assignment\n';

    range(chunks).map(column => {
;
__p += '\nwire ' +
((__t = ( dim(chunkW) )) == null ? '' : __t) +
' dat0_' +
((__t = (column)) == null ? '' : __t) +
'; assign dat0_' +
((__t = (column)) == null ? '' : __t) +
' = t_0_dat' +
((__t = ( slice(chunkW, column * chunkW) )) == null ? '' : __t) +
';';

    })
;
__p += '\n\n';

    range(steps).map(layer => {
        const subset = chunks >> (layer + 1);
        range(subset).map(column => {
;
__p += '\nwire ' +
((__t = ( dim(chunkW) )) == null ? '' : __t) +
' dat' +
((__t = (layer + 1)) == null ? '' : __t) +
'_' +
((__t = (column)) == null ? '' : __t) +
'; assign dat' +
((__t = (layer + 1)) == null ? '' : __t) +
'_' +
((__t = (column)) == null ? '' : __t) +
' = sel[' +
((__t = ( layer )) == null ? '' : __t) +
'] ? dat' +
((__t = (layer)) == null ? '' : __t) +
'_' +
((__t = (column + subset)) == null ? '' : __t) +
' : dat' +
((__t = (layer)) == null ? '' : __t) +
'_' +
((__t = (column)) == null ? '' : __t) +
';';

        if (column >= (subset / 2)) { ;
__p += ' assign i_' +
((__t = (column)) == null ? '' : __t) +
'_dat = dat' +
((__t = (layer + 1)) == null ? '' : __t) +
'_' +
((__t = (column)) == null ? '' : __t) +
';';

            }
        })
    })
;
__p += '\n\nassign i_0_dat = dat' +
((__t = (steps)) == null ? '' : __t) +
'_0;\n\nendmodule\n';

}
return __p
};

var __f9 = function (obj) {
obj || (obj = {});
var __t, __p = '', __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    const range = require('lodash.range');
    const layers = 5;
;
__p += '\nmodule round_sat_dat_' +
((__t = (local.join('_'))) == null ? '' : __t) +
' #(\n    parameter T_0_DAT_WIDTH = 20,\n    parameter I_0_DAT_WIDTH = 16\n) (\n    input        [T_0_DAT_WIDTH - 1 : 0] t_0_dat,\n    output reg [I_0_DAT_WIDTH - 1 : 0] i_0_dat,\n    input clk, reset_n\n);\n\n// Data processing\nwire    [15:0] shift_data;   // shifted data\nreg           pre_sat;      // preliminary saturation detection\nwire           round_flag;   // rounding detection\nwire    [16:0] rounded_data; // rounded data\n\n\nwire  t_0_dat_sign;\nassign t_0_dat_sign = t_0_dat[T_0_DAT_WIDTH-4];\n\nwire  negative_flag; // if the number is negative and the saturation is positive\nassign negative_flag = t_0_dat[T_0_DAT_WIDTH-1];\n\nassign shift_data = t_0_dat[T_0_DAT_WIDTH-5:0];\n\nassign pre_sat = t_0_dat[T_0_DAT_WIDTH-2];\n\nassign round_flag = t_0_dat[T_0_DAT_WIDTH-3];\n\n// Rounding process\nassign rounded_data = {shift_data[15], shift_data} + { 16\'h0000, round_flag};\n\n// Saturation process\nalways @*\n    if(negative_flag)\n        i_0_dat = 0;\n    else\n        if ((pre_sat == 1\'b1) || (rounded_data[16] != rounded_data[15]))\n            i_0_dat = { {I_0_DAT_WIDTH - 15{t_0_dat_sign}}, {15{~t_0_dat_sign}} };\n        else\n            i_0_dat = { {I_0_DAT_WIDTH - 16{rounded_data[15]}}, rounded_data[15:0]};\n   \n\nendmodule\n';

}
return __p
};

var __f8 = function (obj) {
obj || (obj = {});
var __t, __p = '', __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    const range = require('lodash.range');
    const layers = 5;
;
__p += '\nmodule round_sat_dat_' +
((__t = (local.join('_'))) == null ? '' : __t) +
' #(\n    parameter T_0_DAT_WIDTH = 20,\n    parameter I_0_DAT_WIDTH = 16\n) (\n    input        [T_0_DAT_WIDTH - 1 : 0] t_0_dat,\n    output reg [I_0_DAT_WIDTH - 1 : 0] i_0_dat,\n    input clk, reset_n\n);\n\n// Data processing\nwire    [15:0] shift_data;   // shifted data\nreg           pre_sat;      // preliminary saturation detection\nwire           round_flag;   // rounding detection\nwire    [16:0] rounded_data; // rounded data\n\n\nwire  t_0_dat_sign;\nassign t_0_dat_sign = t_0_dat[T_0_DAT_WIDTH-4];\n\nwire  negative_flag; // if the number is negative and the saturation is positive\nassign negative_flag = t_0_dat[T_0_DAT_WIDTH-1];\n\nassign shift_data = t_0_dat[T_0_DAT_WIDTH-5:0];\n\nassign pre_sat = t_0_dat[T_0_DAT_WIDTH-2];\n\nassign round_flag = t_0_dat[T_0_DAT_WIDTH-3];\n\n// Rounding process\nassign rounded_data = {shift_data[15], shift_data} + { 16\'h0000, round_flag};\n\n// Saturation process\nalways @*\n    if(negative_flag)\n        i_0_dat = 0;\n    else\n        if ((pre_sat == 1\'b1) || (rounded_data[16] != rounded_data[15]))\n            i_0_dat = { {I_0_DAT_WIDTH - 15{t_0_dat_sign}}, {15{~t_0_dat_sign}} };\n        else\n            i_0_dat = { {I_0_DAT_WIDTH - 16{rounded_data[15]}}, rounded_data[15:0]};\n   \n\nendmodule\n';

}
return __p
};

module.exports = {
    'bs_dat.v' : __f0,
    'cfg_ctrl.v' : __f1,
    'cfg_dat.v' : __f2,
    'defunnel_ctrl.v' : __f3,
    'defunnel_dat.v' : __f4,
    'funnel_ctrl.v' : __f5,
    'funnel_dat.v' : __f6,
    'round_sat_dat.v' : __f7,
    'round_sat_dat.v~' : __f8,
    'round_sat_dat_1_1.v~' : __f9,
};
