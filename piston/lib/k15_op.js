'use strict';

//const datapath = require('../../../datapath/lib/datapath');
//const macrosDatapath = require('../../../datapath/lib/datapath-macros');

const range = require('lodash.range');
const constants = require('./constants');

const opw = {width: 4+4+16, capacity: 1.5};
const opw1 = {width: 4+4+16, capacity: 1};

module.exports = function (g) {
    return () => {
        const tk15 = g('k15_op');
	const unity1 = g();
	const unity2 = g();
	const ik15 = g('k15_op');
	
	tk15(opw)(unity1)
	unity1(opw1)(unity2)
	unity2(opw)(ik15)

    };
};
     
