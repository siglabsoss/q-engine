'use strict';

const range = require('lodash.range');

module.exports = {
    funnel: {
        // ctrl: p => `funnel_ctrl unode${p.id} ();`,
        ctrl2data: p => [
            ['sel',  'sel'  + p.id,  4],
            ['mode', 'mode' + p.id, -4]
        ]
    },

    defunnel: {
        // ctrl: p => `defunnel_ctrl unode${p.id} ();`,
        ctrl2data: p => [
            ['sel',  'sel'  + p.id,  4],
            ['mode', 'mode' + p.id, -4]
        ]
    },

    bs: {},
    iperm: {
	ctrl2data: p => [
            ['k_ctrl',  'k_ctrl'  + p.id, -4]
        ]
    },
    operm: {
	ctrl2data: p => [
            ['k_ctrl',  'k_ctrl'  + p.id, -4]
        ]
    },
    inmux: {
        ctrl2data: p => [
            ['sel',  'sel'  + p.id +50, -4]
        ]
    },
    oumux: {
	ctrl2data: p => [
            ['sel',  'sel'  + p.id +50, -4]
        ]
    },
    cfg: {},
    vector: {
	ctrl2data: p => [
	    ['instr_0_valid', 'instr_0_valid' + p.id, 1],
	    ['instr_0_ready', 'instr_0_ready' + p.id, -1],
	    ['instr_1_valid', 'instr_1_valid' + p.id, 1],
	    ['instr_1_ready', 'instr_1_ready' + p.id, -1],
	    ['instr_2_valid', 'instr_2_valid' + p.id, 1],
	    ['instr_2_ready', 'instr_2_ready' + p.id, -1],
	    ['instr_3_valid', 'instr_3_valid' + p.id, 1],
	    ['instr_3_ready', 'instr_3_ready' + p.id, -1],
	    ['instr_4_valid', 'instr_4_valid' + p.id, 1],
	    ['instr_4_ready', 'instr_4_ready' + p.id, -1],
	    ['instr_5_valid', 'instr_5_valid' + p.id, 1],
	    ['instr_5_ready', 'instr_5_ready' + p.id, -1],
	    ['instr_6_valid', 'instr_6_valid' + p.id, 1],
	    ['instr_6_ready', 'instr_6_ready' + p.id, -1],
	    ['instr_7_valid', 'instr_7_valid' + p.id, 1],
	    ['instr_7_ready', 'instr_7_ready' + p.id, -1],
	    ['instr_8_valid', 'instr_8_valid' + p.id, 1],
	    ['instr_8_ready', 'instr_8_ready' + p.id, -1],
	    ['instr_9_valid', 'instr_9_valid' + p.id, 1],
	    ['instr_9_ready', 'instr_9_ready' + p.id, -1],
	    ['instr_10_valid', 'instr_10_valid' + p.id, 1],
	    ['instr_10_ready', 'instr_10_ready' + p.id, -1],
	    ['instr_11_valid', 'instr_11_valid' + p.id, 1],
	    ['instr_11_ready', 'instr_11_ready' + p.id, -1],
	    ['instr_12_valid', 'instr_12_valid' + p.id, 1],
	    ['instr_12_ready', 'instr_12_ready' + p.id, -1],
	    ['instr_13_valid', 'instr_13_valid' + p.id, 1],
	    ['instr_13_ready', 'instr_13_ready' + p.id, -1],
	    ['instr_14_valid', 'instr_14_valid' + p.id, 1],
	    ['instr_14_ready', 'instr_14_ready' + p.id, -1],
	    ['instr_15_valid', 'instr_15_valid' + p.id, 1],
	    ['instr_15_ready', 'instr_15_ready' + p.id, -1],
/*	    ['instr_16_valid', 'instr_16_valid' + p.id, 1],
	    ['instr_16_ready', 'instr_16_ready' + p.id, -1],
	    ['instr_17_valid', 'instr_17_valid' + p.id, 1],
	    ['instr_17_ready', 'instr_17_ready' + p.id, -1],
	    ['instr_18_valid', 'instr_18_valid' + p.id, 1],
	    ['instr_18_ready', 'instr_18_ready' + p.id, -1],
	    ['instr_19_valid', 'instr_19_valid' + p.id, 1],
	    ['instr_19_ready', 'instr_19_ready' + p.id, -1],
	    ['instr_20_valid', 'instr_20_valid' + p.id, 1],
	    ['instr_20_ready', 'instr_20_ready' + p.id, -1],
	    ['instr_21_valid', 'instr_21_valid' + p.id, 1],
	    ['instr_21_ready', 'instr_21_ready' + p.id, -1],
	    ['instr_22_valid', 'instr_22_valid' + p.id, 1],
	    ['instr_22_ready', 'instr_22_ready' + p.id, -1],
	    ['instr_23_valid', 'instr_23_valid' + p.id, 1],
	    ['instr_23_ready', 'instr_23_ready' + p.id, -1],
	    ['instr_24_valid', 'instr_24_valid' + p.id, 1],
	    ['instr_24_ready', 'instr_24_ready' + p.id, -1],
	    ['instr_25_valid', 'instr_25_valid' + p.id, 1],
	    ['instr_25_ready', 'instr_25_ready' + p.id, -1],
	    ['instr_26_valid', 'instr_26_valid' + p.id, 1],
	    ['instr_26_ready', 'instr_26_ready' + p.id, -1],
	    ['instr_27_valid', 'instr_27_valid' + p.id, 1],
	    ['instr_27_ready', 'instr_27_ready' + p.id, -1],
	    ['instr_28_valid', 'instr_28_valid' + p.id, 1],
	    ['instr_28_ready', 'instr_28_ready' + p.id, -1],
	    ['instr_29_valid', 'instr_29_valid' + p.id, 1],
	    ['instr_29_ready', 'instr_29_ready' + p.id, -1],
	    ['instr_30_valid', 'instr_30_valid' + p.id, 1],
	    ['instr_30_ready', 'instr_30_ready' + p.id, -1],
	    ['instr_31_valid', 'instr_31_valid' + p.id, 1],
	    ['instr_31_ready', 'instr_31_ready' + p.id, -1],*/
	    
	    ['tk15_valid', 'tk15_valid' + p.id, 1],
	    ['tk15_ready', 'tk15_ready' + p.id, -1],

	    ['ik15_valid', 'ik15_valid' + p.id, -1],
	    ['ik15_ready', 'ik15_ready' + p.id, 1],

	    ['kap_valid', 'kap_valid' + p.id, -1],
	    ['kap_ready', 'kap_ready' + p.id, 1]
	]
    },
    vmem: {
	parameters: range(32).reduce((res, index) => {
	    res['VMEM' + index] = pindex => 'vmem' + index + '.mif';
            return res;
	}, {VMEM_SIZE: () => 4096}),
	    
	ctrl2data: p => [
	    ['idma_valid',  'idma_valid'  + p.id,  4],
	    ['idma_ready',  'idma_ready'  + p.id, -4],

	    ['odma_valid',  'odma_valid'  + p.id, -4],
	    ['odma_ready',  'odma_ready'  + p.id,  4],

	    ['tvs_valid',  'tvs_valid'  + p.id,  1],
	    ['tvs_ready',  'tvs_ready'  + p.id, -1],

	    ['ivs_valid',  'ivs_valid'  + p.id, -1],
	    ['ivs_ready',  'ivs_ready'  + p.id,  1],
	    
            ['k_ctrl',  'k_ctrl'  + p.id, -4]
        ]
    },
    ka_decode: {
	ctrl2data: p => [
            ['k_ctrl',  'k_ctrl'  + p.id, -4]
        ]
    },
    p_decode: {
	ctrl2data: p => [
            ['k_ctrl',  'k_ctrl'  + p.id, -4]
        ]
    },
    perm_addr: {},
    perm_data: {},
    perm_full_addr: {},
    perm_full_data: {},
    rdp_systolic: {},
    kap_ctrl: {},
    datapath: {}
//    deconcat: {}
};
