// {"dataWidth":16,"addrWidth":9,"betaWidth":6,"nCordics":5,"corrector":0,"scale":0.99999}
module nco (
    // per node (target / initiator)
    input              clk,
    input              reset_n,
    input       [31:0] t_angle_dat,
    input              t_angle_req,
    output             t_angle_ack,
    output      [31:0] i_nco_dat,
    output             i_nco_req,
    input              i_nco_ack
);
// per edge
wire      [31:0] dat0, dat0_nxt;
wire      [67:0] dat1, dat1_nxt;
wire      [67:0] dat2, dat2_nxt;
wire      [67:0] dat3, dat3_nxt;
wire      [67:0] dat4, dat4_nxt;
wire      [67:0] dat5, dat5_nxt;
wire      [67:0] dat6, dat6_nxt;
wire      [31:0] dat7;
// per node
// node:0 is target port
assign dat0_nxt = t_angle_dat;

// node:1 macro nco_lut

// Look-Up stage
/*
{JSON.stringify(lut, null, 4)}
*/

reg [31:0] ncolut;

always @*
casez (node1_addr)
0 : ncolut = {16'd50, 16'd65535};
1 : ncolut = {16'd150, 16'd65535};
2 : ncolut = {16'd251, 16'd65534};
3 : ncolut = {16'd351, 16'd65534};
4 : ncolut = {16'd452, 16'd65533};
5 : ncolut = {16'd552, 16'd65533};
6 : ncolut = {16'd653, 16'd65532};
7 : ncolut = {16'd753, 16'd65531};
8 : ncolut = {16'd854, 16'd65529};
9 : ncolut = {16'd955, 16'd65528};
10 : ncolut = {16'd1055, 16'd65526};
11 : ncolut = {16'd1156, 16'd65525};
12 : ncolut = {16'd1256, 16'd65523};
13 : ncolut = {16'd1357, 16'd65521};
14 : ncolut = {16'd1457, 16'd65519};
15 : ncolut = {16'd1558, 16'd65516};
16 : ncolut = {16'd1658, 16'd65514};
17 : ncolut = {16'd1759, 16'd65511};
18 : ncolut = {16'd1859, 16'd65508};
19 : ncolut = {16'd1960, 16'd65506};
20 : ncolut = {16'd2060, 16'd65502};
21 : ncolut = {16'd2161, 16'd65499};
22 : ncolut = {16'd2261, 16'd65496};
23 : ncolut = {16'd2361, 16'd65492};
24 : ncolut = {16'd2462, 16'd65489};
25 : ncolut = {16'd2562, 16'd65485};
26 : ncolut = {16'd2663, 16'd65481};
27 : ncolut = {16'd2763, 16'd65477};
28 : ncolut = {16'd2864, 16'd65472};
29 : ncolut = {16'd2964, 16'd65468};
30 : ncolut = {16'd3065, 16'd65463};
31 : ncolut = {16'd3165, 16'd65458};
32 : ncolut = {16'd3265, 16'd65453};
33 : ncolut = {16'd3366, 16'd65448};
34 : ncolut = {16'd3466, 16'd65443};
35 : ncolut = {16'd3567, 16'd65438};
36 : ncolut = {16'd3667, 16'd65432};
37 : ncolut = {16'd3767, 16'd65426};
38 : ncolut = {16'd3868, 16'd65421};
39 : ncolut = {16'd3968, 16'd65415};
40 : ncolut = {16'd4068, 16'd65408};
41 : ncolut = {16'd4169, 16'd65402};
42 : ncolut = {16'd4269, 16'd65396};
43 : ncolut = {16'd4369, 16'd65389};
44 : ncolut = {16'd4470, 16'd65382};
45 : ncolut = {16'd4570, 16'd65375};
46 : ncolut = {16'd4670, 16'd65368};
47 : ncolut = {16'd4770, 16'd65361};
48 : ncolut = {16'd4871, 16'd65354};
49 : ncolut = {16'd4971, 16'd65346};
50 : ncolut = {16'd5071, 16'd65338};
51 : ncolut = {16'd5171, 16'd65330};
52 : ncolut = {16'd5272, 16'd65322};
53 : ncolut = {16'd5372, 16'd65314};
54 : ncolut = {16'd5472, 16'd65306};
55 : ncolut = {16'd5572, 16'd65297};
56 : ncolut = {16'd5672, 16'd65289};
57 : ncolut = {16'd5772, 16'd65280};
58 : ncolut = {16'd5873, 16'd65271};
59 : ncolut = {16'd5973, 16'd65262};
60 : ncolut = {16'd6073, 16'd65253};
61 : ncolut = {16'd6173, 16'd65243};
62 : ncolut = {16'd6273, 16'd65234};
63 : ncolut = {16'd6373, 16'd65224};
64 : ncolut = {16'd6473, 16'd65214};
65 : ncolut = {16'd6573, 16'd65204};
66 : ncolut = {16'd6673, 16'd65194};
67 : ncolut = {16'd6773, 16'd65184};
68 : ncolut = {16'd6873, 16'd65173};
69 : ncolut = {16'd6973, 16'd65163};
70 : ncolut = {16'd7073, 16'd65152};
71 : ncolut = {16'd7173, 16'd65141};
72 : ncolut = {16'd7273, 16'd65130};
73 : ncolut = {16'd7373, 16'd65119};
74 : ncolut = {16'd7473, 16'd65107};
75 : ncolut = {16'd7573, 16'd65096};
76 : ncolut = {16'd7672, 16'd65084};
77 : ncolut = {16'd7772, 16'd65072};
78 : ncolut = {16'd7872, 16'd65060};
79 : ncolut = {16'd7972, 16'd65048};
80 : ncolut = {16'd8072, 16'd65036};
81 : ncolut = {16'd8171, 16'd65023};
82 : ncolut = {16'd8271, 16'd65011};
83 : ncolut = {16'd8371, 16'd64998};
84 : ncolut = {16'd8471, 16'd64985};
85 : ncolut = {16'd8570, 16'd64972};
86 : ncolut = {16'd8670, 16'd64959};
87 : ncolut = {16'd8769, 16'd64945};
88 : ncolut = {16'd8869, 16'd64932};
89 : ncolut = {16'd8969, 16'd64918};
90 : ncolut = {16'd9068, 16'd64904};
91 : ncolut = {16'd9168, 16'd64890};
92 : ncolut = {16'd9267, 16'd64876};
93 : ncolut = {16'd9367, 16'd64862};
94 : ncolut = {16'd9466, 16'd64847};
95 : ncolut = {16'd9566, 16'd64833};
96 : ncolut = {16'd9665, 16'd64818};
97 : ncolut = {16'd9765, 16'd64803};
98 : ncolut = {16'd9864, 16'd64788};
99 : ncolut = {16'd9963, 16'd64773};
100 : ncolut = {16'd10063, 16'd64758};
101 : ncolut = {16'd10162, 16'd64742};
102 : ncolut = {16'd10261, 16'd64726};
103 : ncolut = {16'd10361, 16'd64711};
104 : ncolut = {16'd10460, 16'd64695};
105 : ncolut = {16'd10559, 16'd64679};
106 : ncolut = {16'd10658, 16'd64662};
107 : ncolut = {16'd10758, 16'd64646};
108 : ncolut = {16'd10857, 16'd64629};
109 : ncolut = {16'd10956, 16'd64613};
110 : ncolut = {16'd11055, 16'd64596};
111 : ncolut = {16'd11154, 16'd64579};
112 : ncolut = {16'd11253, 16'd64561};
113 : ncolut = {16'd11352, 16'd64544};
114 : ncolut = {16'd11451, 16'd64527};
115 : ncolut = {16'd11550, 16'd64509};
116 : ncolut = {16'd11649, 16'd64491};
117 : ncolut = {16'd11748, 16'd64473};
118 : ncolut = {16'd11847, 16'd64455};
119 : ncolut = {16'd11946, 16'd64437};
120 : ncolut = {16'd12044, 16'd64418};
121 : ncolut = {16'd12143, 16'd64400};
122 : ncolut = {16'd12242, 16'd64381};
123 : ncolut = {16'd12341, 16'd64362};
124 : ncolut = {16'd12440, 16'd64343};
125 : ncolut = {16'd12538, 16'd64324};
126 : ncolut = {16'd12637, 16'd64305};
127 : ncolut = {16'd12736, 16'd64285};
128 : ncolut = {16'd12834, 16'd64266};
129 : ncolut = {16'd12933, 16'd64246};
130 : ncolut = {16'd13031, 16'd64226};
131 : ncolut = {16'd13130, 16'd64206};
132 : ncolut = {16'd13228, 16'd64186};
133 : ncolut = {16'd13327, 16'd64165};
134 : ncolut = {16'd13425, 16'd64145};
135 : ncolut = {16'd13523, 16'd64124};
136 : ncolut = {16'd13622, 16'd64103};
137 : ncolut = {16'd13720, 16'd64082};
138 : ncolut = {16'd13818, 16'd64061};
139 : ncolut = {16'd13917, 16'd64040};
140 : ncolut = {16'd14015, 16'd64019};
141 : ncolut = {16'd14113, 16'd63997};
142 : ncolut = {16'd14211, 16'd63975};
143 : ncolut = {16'd14309, 16'd63953};
144 : ncolut = {16'd14407, 16'd63931};
145 : ncolut = {16'd14505, 16'd63909};
146 : ncolut = {16'd14603, 16'd63887};
147 : ncolut = {16'd14701, 16'd63864};
148 : ncolut = {16'd14799, 16'd63842};
149 : ncolut = {16'd14897, 16'd63819};
150 : ncolut = {16'd14995, 16'd63796};
151 : ncolut = {16'd15093, 16'd63773};
152 : ncolut = {16'd15191, 16'd63750};
153 : ncolut = {16'd15289, 16'd63726};
154 : ncolut = {16'd15386, 16'd63703};
155 : ncolut = {16'd15484, 16'd63679};
156 : ncolut = {16'd15582, 16'd63655};
157 : ncolut = {16'd15679, 16'd63631};
158 : ncolut = {16'd15777, 16'd63607};
159 : ncolut = {16'd15875, 16'd63583};
160 : ncolut = {16'd15972, 16'd63559};
161 : ncolut = {16'd16070, 16'd63534};
162 : ncolut = {16'd16167, 16'd63509};
163 : ncolut = {16'd16264, 16'd63484};
164 : ncolut = {16'd16362, 16'd63459};
165 : ncolut = {16'd16459, 16'd63434};
166 : ncolut = {16'd16556, 16'd63409};
167 : ncolut = {16'd16654, 16'd63383};
168 : ncolut = {16'd16751, 16'd63358};
169 : ncolut = {16'd16848, 16'd63332};
170 : ncolut = {16'd16945, 16'd63306};
171 : ncolut = {16'd17042, 16'd63280};
172 : ncolut = {16'd17139, 16'd63254};
173 : ncolut = {16'd17236, 16'd63227};
174 : ncolut = {16'd17333, 16'd63201};
175 : ncolut = {16'd17430, 16'd63174};
176 : ncolut = {16'd17527, 16'd63147};
177 : ncolut = {16'd17624, 16'd63121};
178 : ncolut = {16'd17721, 16'd63093};
179 : ncolut = {16'd17817, 16'd63066};
180 : ncolut = {16'd17914, 16'd63039};
181 : ncolut = {16'd18011, 16'd63011};
182 : ncolut = {16'd18108, 16'd62983};
183 : ncolut = {16'd18204, 16'd62956};
184 : ncolut = {16'd18301, 16'd62928};
185 : ncolut = {16'd18397, 16'd62899};
186 : ncolut = {16'd18494, 16'd62871};
187 : ncolut = {16'd18590, 16'd62843};
188 : ncolut = {16'd18686, 16'd62814};
189 : ncolut = {16'd18783, 16'd62785};
190 : ncolut = {16'd18879, 16'd62757};
191 : ncolut = {16'd18975, 16'd62727};
192 : ncolut = {16'd19072, 16'd62698};
193 : ncolut = {16'd19168, 16'd62669};
194 : ncolut = {16'd19264, 16'd62639};
195 : ncolut = {16'd19360, 16'd62610};
196 : ncolut = {16'd19456, 16'd62580};
197 : ncolut = {16'd19552, 16'd62550};
198 : ncolut = {16'd19648, 16'd62520};
199 : ncolut = {16'd19744, 16'd62490};
200 : ncolut = {16'd19839, 16'd62460};
201 : ncolut = {16'd19935, 16'd62429};
202 : ncolut = {16'd20031, 16'd62398};
203 : ncolut = {16'd20127, 16'd62368};
204 : ncolut = {16'd20222, 16'd62337};
205 : ncolut = {16'd20318, 16'd62306};
206 : ncolut = {16'd20414, 16'd62274};
207 : ncolut = {16'd20509, 16'd62243};
208 : ncolut = {16'd20604, 16'd62211};
209 : ncolut = {16'd20700, 16'd62180};
210 : ncolut = {16'd20795, 16'd62148};
211 : ncolut = {16'd20891, 16'd62116};
212 : ncolut = {16'd20986, 16'd62084};
213 : ncolut = {16'd21081, 16'd62052};
214 : ncolut = {16'd21176, 16'd62019};
215 : ncolut = {16'd21271, 16'd61987};
216 : ncolut = {16'd21366, 16'd61954};
217 : ncolut = {16'd21461, 16'd61921};
218 : ncolut = {16'd21556, 16'd61888};
219 : ncolut = {16'd21651, 16'd61855};
220 : ncolut = {16'd21746, 16'd61822};
221 : ncolut = {16'd21841, 16'd61788};
222 : ncolut = {16'd21936, 16'd61755};
223 : ncolut = {16'd22030, 16'd61721};
224 : ncolut = {16'd22125, 16'd61687};
225 : ncolut = {16'd22220, 16'd61653};
226 : ncolut = {16'd22314, 16'd61619};
227 : ncolut = {16'd22409, 16'd61584};
228 : ncolut = {16'd22503, 16'd61550};
229 : ncolut = {16'd22597, 16'd61515};
230 : ncolut = {16'd22692, 16'd61481};
231 : ncolut = {16'd22786, 16'd61446};
232 : ncolut = {16'd22880, 16'd61411};
233 : ncolut = {16'd22975, 16'd61376};
234 : ncolut = {16'd23069, 16'd61340};
235 : ncolut = {16'd23163, 16'd61305};
236 : ncolut = {16'd23257, 16'd61269};
237 : ncolut = {16'd23351, 16'd61234};
238 : ncolut = {16'd23445, 16'd61198};
239 : ncolut = {16'd23538, 16'd61162};
240 : ncolut = {16'd23632, 16'd61125};
241 : ncolut = {16'd23726, 16'd61089};
242 : ncolut = {16'd23820, 16'd61053};
243 : ncolut = {16'd23913, 16'd61016};
244 : ncolut = {16'd24007, 16'd60979};
245 : ncolut = {16'd24100, 16'd60942};
246 : ncolut = {16'd24194, 16'd60905};
247 : ncolut = {16'd24287, 16'd60868};
248 : ncolut = {16'd24381, 16'd60831};
249 : ncolut = {16'd24474, 16'd60793};
250 : ncolut = {16'd24567, 16'd60756};
251 : ncolut = {16'd24660, 16'd60718};
252 : ncolut = {16'd24753, 16'd60680};
253 : ncolut = {16'd24846, 16'd60642};
254 : ncolut = {16'd24939, 16'd60604};
255 : ncolut = {16'd25032, 16'd60565};
256 : ncolut = {16'd25125, 16'd60527};
257 : ncolut = {16'd25218, 16'd60488};
258 : ncolut = {16'd25311, 16'd60450};
259 : ncolut = {16'd25403, 16'd60411};
260 : ncolut = {16'd25496, 16'd60372};
261 : ncolut = {16'd25589, 16'd60333};
262 : ncolut = {16'd25681, 16'd60293};
263 : ncolut = {16'd25774, 16'd60254};
264 : ncolut = {16'd25866, 16'd60214};
265 : ncolut = {16'd25958, 16'd60174};
266 : ncolut = {16'd26051, 16'd60134};
267 : ncolut = {16'd26143, 16'd60094};
268 : ncolut = {16'd26235, 16'd60054};
269 : ncolut = {16'd26327, 16'd60014};
270 : ncolut = {16'd26419, 16'd59974};
271 : ncolut = {16'd26511, 16'd59933};
272 : ncolut = {16'd26603, 16'd59892};
273 : ncolut = {16'd26695, 16'd59851};
274 : ncolut = {16'd26787, 16'd59810};
275 : ncolut = {16'd26878, 16'd59769};
276 : ncolut = {16'd26970, 16'd59728};
277 : ncolut = {16'd27062, 16'd59686};
278 : ncolut = {16'd27153, 16'd59645};
279 : ncolut = {16'd27245, 16'd59603};
280 : ncolut = {16'd27336, 16'd59561};
281 : ncolut = {16'd27427, 16'd59519};
282 : ncolut = {16'd27519, 16'd59477};
283 : ncolut = {16'd27610, 16'd59435};
284 : ncolut = {16'd27701, 16'd59392};
285 : ncolut = {16'd27792, 16'd59350};
286 : ncolut = {16'd27883, 16'd59307};
287 : ncolut = {16'd27974, 16'd59264};
288 : ncolut = {16'd28065, 16'd59221};
289 : ncolut = {16'd28156, 16'd59178};
290 : ncolut = {16'd28246, 16'd59135};
291 : ncolut = {16'd28337, 16'd59091};
292 : ncolut = {16'd28428, 16'd59048};
293 : ncolut = {16'd28518, 16'd59004};
294 : ncolut = {16'd28609, 16'd58960};
295 : ncolut = {16'd28699, 16'd58916};
296 : ncolut = {16'd28790, 16'd58872};
297 : ncolut = {16'd28880, 16'd58828};
298 : ncolut = {16'd28970, 16'd58784};
299 : ncolut = {16'd29060, 16'd58739};
300 : ncolut = {16'd29150, 16'd58695};
301 : ncolut = {16'd29240, 16'd58650};
302 : ncolut = {16'd29330, 16'd58605};
303 : ncolut = {16'd29420, 16'd58560};
304 : ncolut = {16'd29510, 16'd58515};
305 : ncolut = {16'd29600, 16'd58469};
306 : ncolut = {16'd29689, 16'd58424};
307 : ncolut = {16'd29779, 16'd58378};
308 : ncolut = {16'd29868, 16'd58332};
309 : ncolut = {16'd29958, 16'd58287};
310 : ncolut = {16'd30047, 16'd58241};
311 : ncolut = {16'd30136, 16'd58194};
312 : ncolut = {16'd30226, 16'd58148};
313 : ncolut = {16'd30315, 16'd58102};
314 : ncolut = {16'd30404, 16'd58055};
315 : ncolut = {16'd30493, 16'd58008};
316 : ncolut = {16'd30582, 16'd57962};
317 : ncolut = {16'd30671, 16'd57915};
318 : ncolut = {16'd30760, 16'd57867};
319 : ncolut = {16'd30848, 16'd57820};
320 : ncolut = {16'd30937, 16'd57773};
321 : ncolut = {16'd31026, 16'd57725};
322 : ncolut = {16'd31114, 16'd57678};
323 : ncolut = {16'd31203, 16'd57630};
324 : ncolut = {16'd31291, 16'd57582};
325 : ncolut = {16'd31379, 16'd57534};
326 : ncolut = {16'd31467, 16'd57486};
327 : ncolut = {16'd31556, 16'd57437};
328 : ncolut = {16'd31644, 16'd57389};
329 : ncolut = {16'd31732, 16'd57340};
330 : ncolut = {16'd31820, 16'd57291};
331 : ncolut = {16'd31907, 16'd57243};
332 : ncolut = {16'd31995, 16'd57194};
333 : ncolut = {16'd32083, 16'd57144};
334 : ncolut = {16'd32170, 16'd57095};
335 : ncolut = {16'd32258, 16'd57046};
336 : ncolut = {16'd32345, 16'd56996};
337 : ncolut = {16'd32433, 16'd56946};
338 : ncolut = {16'd32520, 16'd56897};
339 : ncolut = {16'd32607, 16'd56847};
340 : ncolut = {16'd32695, 16'd56797};
341 : ncolut = {16'd32782, 16'd56746};
342 : ncolut = {16'd32869, 16'd56696};
343 : ncolut = {16'd32956, 16'd56646};
344 : ncolut = {16'd33042, 16'd56595};
345 : ncolut = {16'd33129, 16'd56544};
346 : ncolut = {16'd33216, 16'd56493};
347 : ncolut = {16'd33303, 16'd56442};
348 : ncolut = {16'd33389, 16'd56391};
349 : ncolut = {16'd33476, 16'd56340};
350 : ncolut = {16'd33562, 16'd56288};
351 : ncolut = {16'd33648, 16'd56237};
352 : ncolut = {16'd33735, 16'd56185};
353 : ncolut = {16'd33821, 16'd56133};
354 : ncolut = {16'd33907, 16'd56081};
355 : ncolut = {16'd33993, 16'd56029};
356 : ncolut = {16'd34079, 16'd55977};
357 : ncolut = {16'd34164, 16'd55925};
358 : ncolut = {16'd34250, 16'd55872};
359 : ncolut = {16'd34336, 16'd55820};
360 : ncolut = {16'd34421, 16'd55767};
361 : ncolut = {16'd34507, 16'd55714};
362 : ncolut = {16'd34592, 16'd55661};
363 : ncolut = {16'd34678, 16'd55608};
364 : ncolut = {16'd34763, 16'd55555};
365 : ncolut = {16'd34848, 16'd55501};
366 : ncolut = {16'd34933, 16'd55448};
367 : ncolut = {16'd35018, 16'd55394};
368 : ncolut = {16'd35103, 16'd55340};
369 : ncolut = {16'd35188, 16'd55286};
370 : ncolut = {16'd35273, 16'd55232};
371 : ncolut = {16'd35358, 16'd55178};
372 : ncolut = {16'd35442, 16'd55124};
373 : ncolut = {16'd35527, 16'd55069};
374 : ncolut = {16'd35611, 16'd55015};
375 : ncolut = {16'd35695, 16'd54960};
376 : ncolut = {16'd35780, 16'd54905};
377 : ncolut = {16'd35864, 16'd54850};
378 : ncolut = {16'd35948, 16'd54795};
379 : ncolut = {16'd36032, 16'd54740};
380 : ncolut = {16'd36116, 16'd54685};
381 : ncolut = {16'd36200, 16'd54629};
382 : ncolut = {16'd36284, 16'd54574};
383 : ncolut = {16'd36367, 16'd54518};
384 : ncolut = {16'd36451, 16'd54462};
385 : ncolut = {16'd36534, 16'd54406};
386 : ncolut = {16'd36618, 16'd54350};
387 : ncolut = {16'd36701, 16'd54294};
388 : ncolut = {16'd36784, 16'd54238};
389 : ncolut = {16'd36867, 16'd54181};
390 : ncolut = {16'd36950, 16'd54124};
391 : ncolut = {16'd37033, 16'd54068};
392 : ncolut = {16'd37116, 16'd54011};
393 : ncolut = {16'd37199, 16'd53954};
394 : ncolut = {16'd37282, 16'd53897};
395 : ncolut = {16'd37365, 16'd53839};
396 : ncolut = {16'd37447, 16'd53782};
397 : ncolut = {16'd37530, 16'd53725};
398 : ncolut = {16'd37612, 16'd53667};
399 : ncolut = {16'd37694, 16'd53609};
400 : ncolut = {16'd37776, 16'd53551};
401 : ncolut = {16'd37858, 16'd53493};
402 : ncolut = {16'd37940, 16'd53435};
403 : ncolut = {16'd38022, 16'd53377};
404 : ncolut = {16'd38104, 16'd53318};
405 : ncolut = {16'd38186, 16'd53260};
406 : ncolut = {16'd38268, 16'd53201};
407 : ncolut = {16'd38349, 16'd53143};
408 : ncolut = {16'd38431, 16'd53084};
409 : ncolut = {16'd38512, 16'd53025};
410 : ncolut = {16'd38593, 16'd52965};
411 : ncolut = {16'd38675, 16'd52906};
412 : ncolut = {16'd38756, 16'd52847};
413 : ncolut = {16'd38837, 16'd52787};
414 : ncolut = {16'd38918, 16'd52728};
415 : ncolut = {16'd38998, 16'd52668};
416 : ncolut = {16'd39079, 16'd52608};
417 : ncolut = {16'd39160, 16'd52548};
418 : ncolut = {16'd39240, 16'd52488};
419 : ncolut = {16'd39321, 16'd52428};
420 : ncolut = {16'd39401, 16'd52367};
421 : ncolut = {16'd39482, 16'd52307};
422 : ncolut = {16'd39562, 16'd52246};
423 : ncolut = {16'd39642, 16'd52185};
424 : ncolut = {16'd39722, 16'd52124};
425 : ncolut = {16'd39802, 16'd52063};
426 : ncolut = {16'd39882, 16'd52002};
427 : ncolut = {16'd39961, 16'd51941};
428 : ncolut = {16'd40041, 16'd51880};
429 : ncolut = {16'd40120, 16'd51818};
430 : ncolut = {16'd40200, 16'd51757};
431 : ncolut = {16'd40279, 16'd51695};
432 : ncolut = {16'd40359, 16'd51633};
433 : ncolut = {16'd40438, 16'd51571};
434 : ncolut = {16'd40517, 16'd51509};
435 : ncolut = {16'd40596, 16'd51447};
436 : ncolut = {16'd40675, 16'd51385};
437 : ncolut = {16'd40753, 16'd51322};
438 : ncolut = {16'd40832, 16'd51259};
439 : ncolut = {16'd40911, 16'd51197};
440 : ncolut = {16'd40989, 16'd51134};
441 : ncolut = {16'd41068, 16'd51071};
442 : ncolut = {16'd41146, 16'd51008};
443 : ncolut = {16'd41224, 16'd50945};
444 : ncolut = {16'd41302, 16'd50881};
445 : ncolut = {16'd41380, 16'd50818};
446 : ncolut = {16'd41458, 16'd50755};
447 : ncolut = {16'd41536, 16'd50691};
448 : ncolut = {16'd41614, 16'd50627};
449 : ncolut = {16'd41691, 16'd50563};
450 : ncolut = {16'd41769, 16'd50499};
451 : ncolut = {16'd41846, 16'd50435};
452 : ncolut = {16'd41923, 16'd50371};
453 : ncolut = {16'd42001, 16'd50306};
454 : ncolut = {16'd42078, 16'd50242};
455 : ncolut = {16'd42155, 16'd50177};
456 : ncolut = {16'd42232, 16'd50113};
457 : ncolut = {16'd42308, 16'd50048};
458 : ncolut = {16'd42385, 16'd49983};
459 : ncolut = {16'd42462, 16'd49918};
460 : ncolut = {16'd42538, 16'd49853};
461 : ncolut = {16'd42615, 16'd49787};
462 : ncolut = {16'd42691, 16'd49722};
463 : ncolut = {16'd42767, 16'd49656};
464 : ncolut = {16'd42843, 16'd49591};
465 : ncolut = {16'd42919, 16'd49525};
466 : ncolut = {16'd42995, 16'd49459};
467 : ncolut = {16'd43071, 16'd49393};
468 : ncolut = {16'd43147, 16'd49327};
469 : ncolut = {16'd43223, 16'd49261};
470 : ncolut = {16'd43298, 16'd49194};
471 : ncolut = {16'd43373, 16'd49128};
472 : ncolut = {16'd43449, 16'd49061};
473 : ncolut = {16'd43524, 16'd48994};
474 : ncolut = {16'd43599, 16'd48928};
475 : ncolut = {16'd43674, 16'd48861};
476 : ncolut = {16'd43749, 16'd48794};
477 : ncolut = {16'd43824, 16'd48726};
478 : ncolut = {16'd43898, 16'd48659};
479 : ncolut = {16'd43973, 16'd48592};
480 : ncolut = {16'd44048, 16'd48524};
481 : ncolut = {16'd44122, 16'd48457};
482 : ncolut = {16'd44196, 16'd48389};
483 : ncolut = {16'd44270, 16'd48321};
484 : ncolut = {16'd44344, 16'd48253};
485 : ncolut = {16'd44418, 16'd48185};
486 : ncolut = {16'd44492, 16'd48117};
487 : ncolut = {16'd44566, 16'd48048};
488 : ncolut = {16'd44640, 16'd47980};
489 : ncolut = {16'd44713, 16'd47911};
490 : ncolut = {16'd44787, 16'd47843};
491 : ncolut = {16'd44860, 16'd47774};
492 : ncolut = {16'd44933, 16'd47705};
493 : ncolut = {16'd45006, 16'd47636};
494 : ncolut = {16'd45079, 16'd47567};
495 : ncolut = {16'd45152, 16'd47498};
496 : ncolut = {16'd45225, 16'd47429};
497 : ncolut = {16'd45298, 16'd47359};
498 : ncolut = {16'd45370, 16'd47290};
499 : ncolut = {16'd45443, 16'd47220};
500 : ncolut = {16'd45515, 16'd47150};
501 : ncolut = {16'd45588, 16'd47080};
502 : ncolut = {16'd45660, 16'd47010};
503 : ncolut = {16'd45732, 16'd46940};
504 : ncolut = {16'd45804, 16'd46870};
505 : ncolut = {16'd45876, 16'd46800};
506 : ncolut = {16'd45947, 16'd46729};
507 : ncolut = {16'd46019, 16'd46659};
508 : ncolut = {16'd46091, 16'd46588};
509 : ncolut = {16'd46162, 16'd46517};
510 : ncolut = {16'd46233, 16'd46446};
511 : ncolut = {16'd46304, 16'd46376};
endcase

wire [31:0] node1_angle;
wire [2:0] node1_phase;
wire [8:0] node1_addr;
wire [17:0] node1_reSwap;
wire [17:0] node1_imSwap;


assign node1_angle = dat0;
assign node1_phase = node1_angle[31:29]; //3 bit phase
assign node1_addr = node1_phase[0]?~node1_angle[28:20]:node1_angle[28:20];
//re = 15:0  im = 31:16
assign node1_reSwap[17:16]=2'b0;
assign node1_imSwap[17:16]=2'b0;
assign node1_reSwap[15:0] = node1_phase[0]^node1_phase[1] ? ncolut[31:16]:ncolut[15:0];
assign node1_imSwap[15:0] = node1_phase[0]^node1_phase[1] ? ncolut[15:0]:ncolut[31:16];

assign dat1_nxt[17:0] = node1_phase[2]^node1_phase[1]?~node1_reSwap:node1_reSwap;
assign dat1_nxt[35:18] = node1_phase[2]?~node1_imSwap:node1_imSwap;
assign dat1_nxt[55:36] = node1_angle[19:0];

// node:2 macro nco_cordic

// CORDIC stage 0
/*
{
    "sigma": 20,
    "shift": 11
}
*/

wire [19:0] beta0;
wire [19:0] beta_calc0;
wire [17:0] re0,im0,re_shift0,im_shift0;


assign  beta0 = dat1[19:0];

assign re0=dat1[17:0];
assign im0=dat1[35:18];

//assign re_shift0={{11{re0[17]}},re0 >> 11};
//assign im_shift0={{11{im0[17]}},im0 >> 11};

assign re_shift0=$signed(re0) >> 11;
assign im_shift0=$signed(im0) >> 11;

assign beta_calc0 = beta0[19]?beta0+20:beta0-20;
assign dat2_nxt[17:0] = beta0[19]?re0-im_shift0 : re0+im_shift0;
assign dat2_nxt[35:18] = beta0[19]?im0+re_shift0 : im0-re_shift0;
assign dat2_nxt[55:36] = beta_calc0;


// node:3 macro nco_cordic

// CORDIC stage 1
/*
{
    "sigma": 10,
    "shift": 12
}
*/

wire [19:0] beta1;
wire [19:0] beta_calc1;
wire [17:0] re1,im1,re_shift1,im_shift1;


assign  beta1 = dat2[19:0];

assign re1=dat2[17:0];
assign im1=dat2[35:18];

//assign re_shift1={{12{re1[17]}},re1 >> 12};
//assign im_shift1={{12{im1[17]}},im1 >> 12};

assign re_shift1=$signed(re1) >> 12;
assign im_shift1=$signed(im1) >> 12;

assign beta_calc1 = beta1[19]?beta1+10:beta1-10;
assign dat3_nxt[17:0] = beta1[19]?re1-im_shift1 : re1+im_shift1;
assign dat3_nxt[35:18] = beta1[19]?im1+re_shift1 : im1-re_shift1;
assign dat3_nxt[55:36] = beta_calc1;


// node:4 macro nco_cordic

// CORDIC stage 2
/*
{
    "sigma": 5,
    "shift": 13
}
*/

wire [19:0] beta2;
wire [19:0] beta_calc2;
wire [17:0] re2,im2,re_shift2,im_shift2;


assign  beta2 = dat3[19:0];

assign re2=dat3[17:0];
assign im2=dat3[35:18];

//assign re_shift2={{13{re2[17]}},re2 >> 13};
//assign im_shift2={{13{im2[17]}},im2 >> 13};

assign re_shift2=$signed(re2) >> 13;
assign im_shift2=$signed(im2) >> 13;

assign beta_calc2 = beta2[19]?beta2+5:beta2-5;
assign dat4_nxt[17:0] = beta2[19]?re2-im_shift2 : re2+im_shift2;
assign dat4_nxt[35:18] = beta2[19]?im2+re_shift2 : im2-re_shift2;
assign dat4_nxt[55:36] = beta_calc2;


// node:5 macro nco_cordic

// CORDIC stage 3
/*
{
    "sigma": 3,
    "shift": 14
}
*/

wire [19:0] beta3;
wire [19:0] beta_calc3;
wire [17:0] re3,im3,re_shift3,im_shift3;


assign  beta3 = dat4[19:0];

assign re3=dat4[17:0];
assign im3=dat4[35:18];

//assign re_shift3={{14{re3[17]}},re3 >> 14};
//assign im_shift3={{14{im3[17]}},im3 >> 14};

assign re_shift3=$signed(re3) >> 14;
assign im_shift3=$signed(im3) >> 14;

assign beta_calc3 = beta3[19]?beta3+3:beta3-3;
assign dat5_nxt[17:0] = beta3[19]?re3-im_shift3 : re3+im_shift3;
assign dat5_nxt[35:18] = beta3[19]?im3+re_shift3 : im3-re_shift3;
assign dat5_nxt[55:36] = beta_calc3;


// node:6 macro nco_cordic

// CORDIC stage 4
/*
{
    "sigma": 1,
    "shift": 15
}
*/

wire [19:0] beta4;
wire [19:0] beta_calc4;
wire [17:0] re4,im4,re_shift4,im_shift4;


assign  beta4 = dat5[19:0];

assign re4=dat5[17:0];
assign im4=dat5[35:18];

//assign re_shift4={{15{re4[17]}},re4 >> 15};
//assign im_shift4={{15{im4[17]}},im4 >> 15};

assign re_shift4=$signed(re4) >> 15;
assign im_shift4=$signed(im4) >> 15;

assign beta_calc4 = beta4[19]?beta4+1:beta4-1;
assign dat6_nxt[17:0] = beta4[19]?re4-im_shift4 : re4+im_shift4;
assign dat6_nxt[35:18] = beta4[19]?im4+re_shift4 : im4-re_shift4;
assign dat6_nxt[55:36] = beta_calc4;


// node:7 macro saturation

wire [17:0] recalc7,imcalc7;
wire [15:0] redata7,imdata7;

assign recalc7=dat6[17:0];
assign imcalc7=dat6[35:18];

assign dat7[15:0]=^recalc7[17:16]?{recalc7[17],{15{~recalc7[17]}}}:{recalc7[17],recalc7[15:1]};

assign dat7[31:16]=^imcalc7[17:16]?{imcalc7[17],{15{~imcalc7[17]}}}:{imcalc7[17],imcalc7[15:1]};

assign redata7 = dat7[15:0];
assign imdata7 = dat7[31:16];


// node:8 is initiator port
assign i_nco_dat = dat7;

// per edge

// edge:0 EB1
wire en0;
reg [31:0] dat0_r;
always @(posedge clk) if (en0) dat0_r <= dat0_nxt;
assign dat0 = dat0_r;


// edge:1 EB1
wire en1;
reg [67:0] dat1_r;
always @(posedge clk) if (en1) dat1_r <= dat1_nxt;
assign dat1 = dat1_r;


// edge:2 EB1
wire en2;
reg [67:0] dat2_r;
always @(posedge clk) if (en2) dat2_r <= dat2_nxt;
assign dat2 = dat2_r;


// edge:3 EB1
wire en3;
reg [67:0] dat3_r;
always @(posedge clk) if (en3) dat3_r <= dat3_nxt;
assign dat3 = dat3_r;


// edge:4 EB1
wire en4;
reg [67:0] dat4_r;
always @(posedge clk) if (en4) dat4_r <= dat4_nxt;
assign dat4 = dat4_r;


// edge:5 EB1
wire en5;
reg [67:0] dat5_r;
always @(posedge clk) if (en5) dat5_r <= dat5_nxt;
assign dat5 = dat5_r;


// edge:6 EB1
wire en6;
reg [67:0] dat6_r;
always @(posedge clk) if (en6) dat6_r <= dat6_nxt;
assign dat6 = dat6_r;


// edge:7 EB0

nco_ctrl uctrl (
    .clk(clk),
    .reset_n(reset_n),
    .t_angle_req(t_angle_req),
    .t_angle_ack(t_angle_ack),
    .i_nco_req(i_nco_req),
    .i_nco_ack(i_nco_ack),
    .en0(en0),
    .en1(en1),
    .en2(en2),
    .en3(en3),
    .en4(en4),
    .en5(en5),
    .en6(en6)
);
endmodule // nco

module nco_ctrl (
    // per node (target / initiator)
    input              clk,
    input              reset_n,
    input              t_angle_req,
    output             t_angle_ack,
    output             i_nco_req,
    input              i_nco_ack,
    output             en0,
    output             en1,
    output             en2,
    output             en3,
    output             en4,
    output             en5,
    output             en6
);
// per edge
wire             req0, ack0, ack0_0, req0_0;
wire             req1, ack1, ack1_0, req1_0;
wire             req2, ack2, ack2_0, req2_0;
wire             req3, ack3, ack3_0, req3_0;
wire             req4, ack4, ack4_0, req4_0;
wire             req5, ack5, ack5_0, req5_0;
wire             req6, ack6, ack6_0, req6_0;
wire             req7, ack7, ack7_0, req7_0;
// node:t_angle target
assign req0 = t_angle_req;
assign t_angle_ack = ack0;

// edge:0 EB1
wire ack0m;
reg req0m;
assign en0 = req0 & ack0;
assign ack0 = ~req0m | ack0m;
always @(posedge clk or negedge reset_n) if (~reset_n) req0m <= 1'b0; else req0m <= ~ack0 | req0;


// edge:0 fork


assign req0_0 = req0m;

assign ack0m = ack0_0;



// edge:1 EB1
wire ack1m;
reg req1m;
assign en1 = req1 & ack1;
assign ack1 = ~req1m | ack1m;
always @(posedge clk or negedge reset_n) if (~reset_n) req1m <= 1'b0; else req1m <= ~ack1 | req1;


// edge:1 fork


assign req1_0 = req1m;

assign ack1m = ack1_0;



// edge:2 EB1
wire ack2m;
reg req2m;
assign en2 = req2 & ack2;
assign ack2 = ~req2m | ack2m;
always @(posedge clk or negedge reset_n) if (~reset_n) req2m <= 1'b0; else req2m <= ~ack2 | req2;


// edge:2 fork


assign req2_0 = req2m;

assign ack2m = ack2_0;



// edge:3 EB1
wire ack3m;
reg req3m;
assign en3 = req3 & ack3;
assign ack3 = ~req3m | ack3m;
always @(posedge clk or negedge reset_n) if (~reset_n) req3m <= 1'b0; else req3m <= ~ack3 | req3;


// edge:3 fork


assign req3_0 = req3m;

assign ack3m = ack3_0;



// edge:4 EB1
wire ack4m;
reg req4m;
assign en4 = req4 & ack4;
assign ack4 = ~req4m | ack4m;
always @(posedge clk or negedge reset_n) if (~reset_n) req4m <= 1'b0; else req4m <= ~ack4 | req4;


// edge:4 fork


assign req4_0 = req4m;

assign ack4m = ack4_0;



// edge:5 EB1
wire ack5m;
reg req5m;
assign en5 = req5 & ack5;
assign ack5 = ~req5m | ack5m;
always @(posedge clk or negedge reset_n) if (~reset_n) req5m <= 1'b0; else req5m <= ~ack5 | req5;


// edge:5 fork


assign req5_0 = req5m;

assign ack5m = ack5_0;



// edge:6 EB1
wire ack6m;
reg req6m;
assign en6 = req6 & ack6;
assign ack6 = ~req6m | ack6m;
always @(posedge clk or negedge reset_n) if (~reset_n) req6m <= 1'b0; else req6m <= ~ack6 | req6;


// edge:6 fork


assign req6_0 = req6m;

assign ack6m = ack6_0;



// edge:7 EB0
wire ack7m, req7m;
assign req7m = req7;
assign ack7 = ack7m;


// edge:7 fork


assign req7_0 = req7m;

assign ack7m = ack7_0;


// node:1 join nco_lut
assign req1 = req0_0;
assign ack0_0 = ack1;
// node:2 join nco_cordic
assign req2 = req1_0;
assign ack1_0 = ack2;
// node:3 join nco_cordic
assign req3 = req2_0;
assign ack2_0 = ack3;
// node:4 join nco_cordic
assign req4 = req3_0;
assign ack3_0 = ack4;
// node:5 join nco_cordic
assign req5 = req4_0;
assign ack4_0 = ack5;
// node:6 join nco_cordic
assign req6 = req5_0;
assign ack5_0 = ack6;
// node:7 join saturation
assign req7 = req6_0;
assign ack6_0 = ack7;
// node:8 initiator
assign i_nco_req = req7_0;
assign ack7_0 = i_nco_ack;
endmodule // nco_ctrl
