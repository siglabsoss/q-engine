'use strict';

const datapath = require('../../../datapath/lib/datapath');
const macrosDatapath = require('../../../datapath/lib/datapath-macros');

const range = require('lodash.range');
const constants = require('./constants');

const k8w = {width: 32*32/constants.div, capacity: 1.5};
const k9w = {width: 32*32/constants.div, capacity: 1.5};
const k14w = {width: 32*32/constants.div, capacity: 1};
const kw = {width: 32 * 32/constants.div, capacity: 1};
const k15w = {width: 32 * 32/constants.div, capacity: 1};
const rkw = {width: 32 * 32/constants.div, capacity: 0};
const rkw15 = {width: 32 * 32/constants.div, capacity: 1.5};
const rkw17 = {width: 32 * 32/constants.div, capacity: 1.7};
const idmaw = { width: 1 + (16+32), capacity: 1.5};
const odmaw = { width: 32, capacity: 1.7};
const odmaweb1 = { width: 32, capacity: 1};
const kctrlw = {width: 4, capacity: 1.5};
const actrlw = {width: 32/constants.div * (11+constants.divlog2), capacity: 1};
const pctrlw = {width: 32/constants.div * (5-constants.divlog2), cpacity: 1};
const kactrlw = {width: 4+32/constants.div*(11+constants.divlog2), capacity: 1};
const kpctrlw = {width: 4+32/constants.div*(5-constants.divlog2), capacity: 1};
const kakpctrlw = {width: 4+4+32/constants.div*(11+5), capacity: 1.5};
console.log(kakpctrlw,pctrlw,kactrlw)
const iperm_iw = {width: 32*32/constants.div , capacity:  1};
const operm_ow = {width: 32*32/constants.div , capacity: 1.5};
const cmdw_eb15= {width: 64, capacity: 1.5};
const cmdw_eb1= {width: 64, capacity: 1};
const cmdw={width: 64, capacity: 1.5};
const cmd_s1w={width: 64, capacity: 1.5};
const cmd_s2w={width: 64, capacity: 1.5};
const cmd_s3w={width: 64, capacity: 1.5};
const k_imuxw = {width: 4, capacity: 2};
const kp_ipermw = {width: 4+32/constants.div*(5-constants.divlog2), capacity: 3};
const ka_vmemw = {width: 4+32/constants.div*(11+constants.divlog2), capacity: 4};
const kp_opermw = {width: 4+32/constants.div*(5-constants.divlog2), capacity: 3};
const k_omuxw = {width: 4, capacity: 4};
const k13w = {width: 32*32/constants.div, capacity: 4};
/*const k_imuxw = {width: 4, capacity: 1};
const kp_ipermw = {width: 4+32/constants.div*(5-constants.divlog2), capacity: 1};
const ka_vmemw = {width: 4+32/constants.div*(11+constants.divlog2), capacity: 1};
const kp_opermw = {width: 4+32/constants.div*(5-constants.divlog2), capacity: 1};
const k_omuxw = {width: 4, capacity: 1};
*/

console.log(4+32/constants.div*(11+constants.divlog2))
module.exports = function (g) {
    return () => {
        const cmd = g('instr');
//	const cmd_s0_1 = g();

	const cmd_s1_1 = g();
	const cmd_s1_2 = g();
	
	const cmd_s2_1 = g();
	const cmd_s2_2 = g();
	const cmd_s2_3 = g();
	const cmd_s2_4 = g();

	const cmd_sx_1 = g();
	const cmd_sx_2 = g();
	const cmd_sx_3 = g();
	const cmd_sx_4 = g();
	const cmd_sx_5 = g();
	const cmd_sx_6 = g();
	const cmd_sx_7 = g();
	const cmd_sx_8 = g();
	
	const tdma_0 = g('idma_0');
	const tdma_1 = g('idma_1');
	const tdma_1_s1 = g();
	const tdma_2 = g('idma_2');
	const tdma_3 = g('idma_3');
	const idma_0 = g('odma_0');
	const idma_1 = g('odma_1');
	const idma_1s1 = g();
	const idma_2 = g('odma_2');
	const idma_2s1 = g();
	const idma_3 = g('odma_3');
        const vector = g('vector');
        const imux = g('inmux');
//        const iperm = g('iperm');
//	const vmemconcat = g('concat');
        const vmem = g('vmem');
//        const operm = g('operm');
        const omux = g('oumux');
	//        const datapath = g('rdp_systolic');
	const kap_deconcat = g('deconcat');
	const perm_addr = g('perm_full_addr');
	const iperm_data = g('perm_full_data');
	const operm_data = g('perm_full_data');
	const ka_decode = g('ka_decode');
	const p_decode = g('p_decode');
	
//	const kapctrl = g('kap_ctrl');

	const vmem_operm = g();

	
	cmd(cmd_s1w)(cmd_s1_1)(cmd_s1_2)
//	cmd_s0_1(cmd_s1w)(cmd_s1_1)(cmd_s1_2)

	cmd_s1_1(cmd_s2w)(cmd_s2_1)(cmd_s2_2);
	cmd_s1_2(cmd_s2w)(cmd_s2_3)(cmd_s2_4);

	cmd_s2_1(cmd_s2w)(cmd_sx_1)(cmd_sx_2);
	cmd_s2_2(cmd_s2w)(cmd_sx_3)(cmd_sx_4);
	cmd_s2_3(cmd_s2w)(cmd_sx_5)(cmd_sx_6);	
	cmd_s2_4(cmd_s2w)(cmd_sx_7)(cmd_sx_8);

	[cmd_sx_1, cmd_sx_2, cmd_sx_3, cmd_sx_4, cmd_sx_5, cmd_sx_6, cmd_sx_7, cmd_sx_8].map((myNode, nIndex) => {
	    const myEdge = myNode(cmdw_eb15);
	    range(4/constants.div).map(index => {
		const eqnode = g();
		myEdge(eqnode);
		eqnode(cmd_s3w)(vector, 'instr_' + ((4/constants.div * nIndex + index)));
	    });
	});


//        datapath(kw,'k1')(imux,'k1'); // k1
//        datapath(kw,'k2')(imux,'k2'); // k2
        vector(rkw15,'k15')(imux,'k15'); // k15

        imux(k15w,'inmux')(iperm_data,'data');
        iperm_data(kw,'data')(vmem,'ivs');
        vmem(rkw,'ovs')(vmem_operm);
	vmem_operm(k15w)(operm_data,'data');
        operm_data(operm_ow,'data')(omux,'oumux');

//        omux(kw,'k8')(datapath,'k8'); // k8
//        omux(kw,'k9')(datapath,'k9'); // k9
//        omux(kw,'k10')(datapath,'k10'); // k10
//        omux(kw,'k11')(datapath,'k11'); // k11
//        omux(kw,'k14')(datapath,'c'); // k14
        omux(rkw15,'k15')(vector,'k15'); // k15
	const dpTargets = {
	    k8: omux(k8w,'k8'),
	    k9: omux(k9w,'k9'),
	    k14: omux(k14w,'k14')
	};
	omux(k13w,'k13')(imux,'k13');

	const dpInitiators = datapath(g)(dpTargets);

	dpInitiators.k1(imux,'k1');
	
//	vector(kapctrlw, 'kap')(kapctrl,'kap')
	vector(kakpctrlw, 'kap')(kap_deconcat)

	kap_deconcat(kpctrlw)(perm_addr,'0')
	kap_deconcat(kactrlw)(ka_decode,'ka')
	

	ka_decode(ka_vmemw, 'ka')(vmem,'ka')
	
	ka_decode(k_imuxw, 'k_sk')(imux,'c')
	perm_addr(kpctrlw, '0')(p_decode,'kp')

	ka_decode(k_omuxw, 'k_lk')(omux,'c')

	p_decode(kp_ipermw, 'p_sk')(iperm_data,'addr')
	p_decode(kp_opermw, 'p_lk')(operm_data,'addr')
	
	
	tdma_0(idmaw,'idma_0')(vmem,'idma_0');
	tdma_1(idmaw,'idma_1')(tdma_1_s1)
	tdma_1_s1(idmaw)(vmem,'idma_1');
	tdma_2(idmaw,'idma_2')(vmem,'idma_2');
	tdma_3(idmaw,'idma_3')(vmem,'idma_3');
	
	vmem(odmaw,'odma_0')(idma_0,'odma_0');
	vmem(odmaw,'odma_1')(idma_1s1);
	idma_1s1(odmaweb1)(idma_1,'odma_1');
	vmem(odmaw,'odma_2')(idma_2s1);
	idma_2s1(odmaweb1)(idma_2,'odma_2');
	vmem(odmaw,'odma_3')(idma_3,'odma_3');

    };
};
