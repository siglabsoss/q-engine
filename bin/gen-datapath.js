#!/usr/bin/env node
'use strict';

const datapath = require('../lib/datapath.js');
const fhyperDot = require('elastic-circuit/lib/fhyper-dot');
const fhyperV = require('elastic-circuit/lib/fhyper-verilog');
const fs = require('fs');

const g = datapath();
fs.writeFile('datapath.dot', fhyperDot(g), () => {});
fs.writeFile('datapath.v',   fhyperV(g),   () => {});
