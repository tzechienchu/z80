module test_memory (input Clk,
					input Reset, 
                    input [1:0] wmask,
                    output [7:0] mem_out,
                    input [7:0] mem_in_top,mem_in_bottom,
                    input [19:0] A,
                    input write,read );
												
   parameter size = 1000; // expand memory as needed (current is 64 words)
	 
   logic [7:0] mem_array [size-1:0];
   logic [7:0] mem_out;
   logic [7:0] I_O_wire;
	 
   assign mem_out = mem_array[A[9:0]];  //ATTENTION: Size here must correspond to size of
              // memory vector above.  Current size is 64, so the slice must be 6 bits.  If size were 1024,
              // slice would have to be 10 bits.  (There are three more places below where values must stay
              // consistent as well.)

   /* Read */
    always_comb
    begin
        I_O_wire = 8'bZZZZZZZZ;
        if(RE) I_O_wire = mem_out;
    end

    /* Write */
    always @(posedge clk)
    begin
        if (WE)
        begin
            if (wmask[1])
            begin
                mem[A[7:0]+1'b1] = mem_in[15:8];
            end

            if (wmask[0])
            begin
                mem[A[7:0]] = mem_in[7:0];
            end
        end
    end

    /* Memory Response */
    assign resp = read | write;
	  
   always_ff @ (posedge Clk or posedge Reset)
   begin
		if(Reset)   // Insert initial memory contents here
		begin
		
        mem_array[0] <= 8'hf3;
        mem_array[1] <= 8'hc3;
        mem_array[2] <= 8'h00;
        mem_array[3] <= 8'h01;
        mem_array[4] <= 8'h00;
        mem_array[5] <= 8'h00;
        mem_array[6] <= 8'h00;
        mem_array[7] <= 8'h00;
        mem_array[8] <= 8'hc3;
        mem_array[9] <= 8'h27;
        mem_array[10] <= 8'h2e;
        mem_array[11] <= 8'h00;
        mem_array[12] <= 8'h00;
        mem_array[13] <= 8'h00;
        mem_array[14] <= 8'h00;
        mem_array[15] <= 8'h00;
        mem_array[16] <= 8'he0;
        mem_array[17] <= 8'h9f;
        mem_array[18] <= 8'hea;
        mem_array[19] <= 8'h00;
        mem_array[20] <= 8'h20;
        mem_array[21] <= 8'hc9;
        mem_array[22] <= 8'h00;
        mem_array[23] <= 8'h00;
        mem_array[24] <= 8'hff;
        mem_array[25] <= 8'h00;
        mem_array[26] <= 8'h00;
        mem_array[27] <= 8'h00;
        mem_array[28] <= 8'h00;
        mem_array[29] <= 8'h00;
        mem_array[30] <= 8'h00;
        mem_array[31] <= 8'h00;
        mem_array[32] <= 8'hff;
        mem_array[33] <= 8'h00;
        mem_array[34] <= 8'h00;
        mem_array[35] <= 8'h00;
        mem_array[36] <= 8'h00;
        mem_array[37] <= 8'h00;
        mem_array[38] <= 8'h00;
        mem_array[39] <= 8'h00;
        mem_array[40] <= 8'hd5;
        mem_array[41] <= 8'h5f;
        mem_array[42] <= 8'h16;
        mem_array[43] <= 8'h00;
        mem_array[44] <= 8'h19;
        mem_array[45] <= 8'h19;
        mem_array[46] <= 8'h2a;
        mem_array[47] <= 8'h0f;
        mem_array[48] <= 8'h6f;
        mem_array[49] <= 8'hd1;
        mem_array[50] <= 8'he9;
        mem_array[51] <= 8'h00;
        mem_array[52] <= 8'h00;
        mem_array[53] <= 8'h00;
        mem_array[54] <= 8'h00;
        mem_array[55] <= 8'h00;
        mem_array[56] <= 8'hff;
        mem_array[57] <= 8'h00;
        mem_array[58] <= 8'h00;
        mem_array[59] <= 8'h00;
        mem_array[60] <= 8'h00;
        mem_array[61] <= 8'h00;
        mem_array[62] <= 8'h00;
        mem_array[63] <= 8'h00;
        mem_array[64] <= 8'hc3;
        mem_array[65] <= 8'h50;
        mem_array[66] <= 8'h01;
        mem_array[67] <= 8'h00;
        mem_array[68] <= 8'h00;
        mem_array[69] <= 8'h00;
        mem_array[70] <= 8'h00;
        mem_array[71] <= 8'h00;
        mem_array[72] <= 8'hc3;
        mem_array[73] <= 8'h1b;
        mem_array[74] <= 8'h04;
        mem_array[75] <= 8'h00;
        mem_array[76] <= 8'h00;
        mem_array[77] <= 8'h00;
        mem_array[78] <= 8'h00;
        mem_array[79] <= 8'h00;
        mem_array[80] <= 8'hd9;
        mem_array[81] <= 8'h00;
        mem_array[82] <= 8'h00;
        mem_array[83] <= 8'h00;
        mem_array[84] <= 8'h00;
        mem_array[85] <= 8'h00;
        mem_array[86] <= 8'h00;
        mem_array[87] <= 8'h00;
        mem_array[88] <= 8'hc3;
        mem_array[89] <= 8'haa;
        mem_array[90] <= 8'h06;
        mem_array[91] <= 8'h00;
        mem_array[92] <= 8'h00;
        mem_array[93] <= 8'h00;
        mem_array[94] <= 8'h00;
        mem_array[95] <= 8'h00;
        mem_array[96] <= 8'hc3;
        mem_array[97] <= 8'hdf;
        mem_array[98] <= 8'h08;
        mem_array[99] <= 8'h00;
        mem_array[100] <= 8'h00;
        mem_array[101] <= 8'h00;
        mem_array[102] <= 8'h00;
        mem_array[103] <= 8'h00;
        mem_array[104] <= 8'h00;
        mem_array[105] <= 8'h00;
        mem_array[106] <= 8'h00;
        mem_array[107] <= 8'h00;
        mem_array[108] <= 8'h00;
        mem_array[109] <= 8'h00;
        mem_array[110] <= 8'h00;
        mem_array[111] <= 8'h00;
        mem_array[112] <= 8'h00;
        mem_array[113] <= 8'h00;
        mem_array[114] <= 8'h00;
        mem_array[115] <= 8'h00;
        mem_array[116] <= 8'h00;
        mem_array[117] <= 8'h00;
        mem_array[118] <= 8'h00;
        mem_array[119] <= 8'h00;
        mem_array[120] <= 8'h00;
        mem_array[121] <= 8'h00;
        mem_array[122] <= 8'h00;
        mem_array[123] <= 8'h00;
        mem_array[124] <= 8'h00;
        mem_array[125] <= 8'h00;
        mem_array[126] <= 8'h00;
        mem_array[127] <= 8'h00;
        mem_array[128] <= 8'h00;
        mem_array[129] <= 8'h00;
        mem_array[130] <= 8'h00;
        mem_array[131] <= 8'h00;
        mem_array[132] <= 8'h00;
        mem_array[133] <= 8'h00;
        mem_array[134] <= 8'h00;
        mem_array[135] <= 8'h00;
        mem_array[136] <= 8'h00;
        mem_array[137] <= 8'h00;
        mem_array[138] <= 8'h00;
        mem_array[139] <= 8'h00;
        mem_array[140] <= 8'h00;
        mem_array[141] <= 8'h00;
        mem_array[142] <= 8'h00;
        mem_array[143] <= 8'h00;
        mem_array[144] <= 8'h00;
        mem_array[145] <= 8'h00;
        mem_array[146] <= 8'h00;
        mem_array[147] <= 8'h00;
        mem_array[148] <= 8'h00;
        mem_array[149] <= 8'h00;
        mem_array[150] <= 8'h00;
        mem_array[151] <= 8'h00;
        mem_array[152] <= 8'h00;
        mem_array[153] <= 8'h00;
        mem_array[154] <= 8'h00;
        mem_array[155] <= 8'h00;
        mem_array[156] <= 8'h00;
        mem_array[157] <= 8'h00;
        mem_array[158] <= 8'h00;
        mem_array[159] <= 8'h00;
        mem_array[160] <= 8'h00;
        mem_array[161] <= 8'h00;
        mem_array[162] <= 8'h00;
        mem_array[163] <= 8'h00;
        mem_array[164] <= 8'h00;
        mem_array[165] <= 8'h00;
        mem_array[166] <= 8'h00;
        mem_array[167] <= 8'h00;
        mem_array[168] <= 8'h00;
        mem_array[169] <= 8'h00;
        mem_array[170] <= 8'h00;
        mem_array[171] <= 8'h00;
        mem_array[172] <= 8'h00;
        mem_array[173] <= 8'h00;
        mem_array[174] <= 8'h00;
        mem_array[175] <= 8'h00;
        mem_array[176] <= 8'h00;
        mem_array[177] <= 8'h00;
        mem_array[178] <= 8'h00;
        mem_array[179] <= 8'h00;
        mem_array[180] <= 8'h00;
        mem_array[181] <= 8'h00;
        mem_array[182] <= 8'h00;
        mem_array[183] <= 8'h00;
        mem_array[184] <= 8'h00;
        mem_array[185] <= 8'h00;
        mem_array[186] <= 8'h00;
        mem_array[187] <= 8'h00;
        mem_array[188] <= 8'h00;
        mem_array[189] <= 8'h00;
        mem_array[190] <= 8'h00;
        mem_array[191] <= 8'h00;
        mem_array[192] <= 8'h00;
        mem_array[193] <= 8'h00;
        mem_array[194] <= 8'h00;
        mem_array[195] <= 8'h00;
        mem_array[196] <= 8'h00;
        mem_array[197] <= 8'h00;
        mem_array[198] <= 8'h00;
        mem_array[199] <= 8'h00;
        mem_array[200] <= 8'h00;
        mem_array[201] <= 8'h00;
        mem_array[202] <= 8'h00;
        mem_array[203] <= 8'h00;
        mem_array[204] <= 8'h00;
        mem_array[205] <= 8'h00;
        mem_array[206] <= 8'h00;
        mem_array[207] <= 8'h00;
        mem_array[208] <= 8'h00;
        mem_array[209] <= 8'h00;
        mem_array[210] <= 8'h00;
        mem_array[211] <= 8'h00;
        mem_array[212] <= 8'h00;
        mem_array[213] <= 8'h00;
        mem_array[214] <= 8'h00;
        mem_array[215] <= 8'h00;
        mem_array[216] <= 8'h00;
        mem_array[217] <= 8'h00;
        mem_array[218] <= 8'h00;
        mem_array[219] <= 8'h00;
        mem_array[220] <= 8'h00;
        mem_array[221] <= 8'h00;
        mem_array[222] <= 8'h00;
        mem_array[223] <= 8'h00;
        mem_array[224] <= 8'h00;
        mem_array[225] <= 8'h00;
        mem_array[226] <= 8'h00;
        mem_array[227] <= 8'h00;
        mem_array[228] <= 8'h00;
        mem_array[229] <= 8'h00;
        mem_array[230] <= 8'h00;
        mem_array[231] <= 8'h00;
        mem_array[232] <= 8'h00;
        mem_array[233] <= 8'h00;
        mem_array[234] <= 8'h00;
        mem_array[235] <= 8'h00;
        mem_array[236] <= 8'h00;
        mem_array[237] <= 8'h00;
        mem_array[238] <= 8'h00;
        mem_array[239] <= 8'h00;
        mem_array[240] <= 8'h00;
        mem_array[241] <= 8'h00;
        mem_array[242] <= 8'h00;
        mem_array[243] <= 8'h00;
        mem_array[244] <= 8'h00;
        mem_array[245] <= 8'h00;
        mem_array[246] <= 8'h00;
        mem_array[247] <= 8'h00;
        mem_array[248] <= 8'h00;
        mem_array[249] <= 8'h00;
        mem_array[250] <= 8'h00;
        mem_array[251] <= 8'h00;
        mem_array[252] <= 8'h00;
        mem_array[253] <= 8'h00;
        mem_array[254] <= 8'h00;
        mem_array[255] <= 8'h00;
        mem_array[256] <= 8'h00;
        mem_array[257] <= 8'hc3;
        mem_array[258] <= 8'hc6;
        mem_array[259] <= 8'h05;
        mem_array[260] <= 8'hce;
        mem_array[261] <= 8'hed;
        mem_array[262] <= 8'h0f;
        mem_array[263] <= 8'h0f;
        mem_array[264] <= 8'hcc;
        mem_array[265] <= 8'h0d;
        mem_array[266] <= 8'h00;
        mem_array[267] <= 8'h0b;
        mem_array[268] <= 8'h03;
        mem_array[269] <= 8'h73;
        mem_array[270] <= 8'h00;
        mem_array[271] <= 8'h83;
        mem_array[272] <= 8'h00;
        mem_array[273] <= 8'h0c;
        mem_array[274] <= 8'h00;
        mem_array[275] <= 8'h0d;
        mem_array[276] <= 8'h00;
        mem_array[277] <= 8'h08;
        mem_array[278] <= 8'h11;
        mem_array[279] <= 8'h1f;
        mem_array[280] <= 8'h88;
        mem_array[281] <= 8'h89;
        mem_array[282] <= 8'h00;
        mem_array[283] <= 8'h0e;
        mem_array[284] <= 8'hdc;
        mem_array[285] <= 8'hcc;
        mem_array[286] <= 8'h6e;
        mem_array[287] <= 8'he6;
        mem_array[288] <= 8'hdd;
        mem_array[289] <= 8'hdd;
        mem_array[290] <= 8'hd9;
        mem_array[291] <= 8'h99;
        mem_array[292] <= 8'hbb;
        mem_array[293] <= 8'hbb;
        mem_array[294] <= 8'h67;
        mem_array[295] <= 8'h0c;
        mem_array[296] <= 8'h6e;
        mem_array[297] <= 8'h0e;
        mem_array[298] <= 8'hec;
        mem_array[299] <= 8'hcc;
        mem_array[300] <= 8'hdd;
        mem_array[301] <= 8'hdc;
        mem_array[302] <= 8'h99;
        mem_array[303] <= 8'h9f;
        mem_array[304] <= 8'hbb;
        mem_array[305] <= 8'hb9;
        mem_array[306] <= 8'h03;
        mem_array[307] <= 8'h3e;
        mem_array[308] <= 8'h50;
        mem_array[309] <= 8'h4f;
        mem_array[310] <= 8'h4b;
        mem_array[311] <= 8'h45;
        mem_array[312] <= 8'h4d;
        mem_array[313] <= 8'h4f;
        mem_array[314] <= 8'h4e;
        mem_array[315] <= 8'h5f;
        mem_array[316] <= 8'h47;
        mem_array[317] <= 8'h4c;
        mem_array[318] <= 8'h44;
        mem_array[319] <= 8'h41;
        mem_array[320] <= 8'h41;
        mem_array[321] <= 8'h55;
        mem_array[322] <= 8'h45;
        mem_array[323] <= 8'h80;
        mem_array[324] <= 8'h00;
        mem_array[325] <= 8'h01;
        mem_array[326] <= 8'h03;
        mem_array[327] <= 8'h10;
        mem_array[328] <= 8'h06;
        mem_array[329] <= 8'h03;
        mem_array[330] <= 8'h01;
        mem_array[331] <= 8'h03;
        mem_array[332] <= 8'h00;
        mem_array[333] <= 8'h4b;
        mem_array[334] <= 8'h68;
        mem_array[335] <= 8'h2d;
        mem_array[336] <= 8'hf5;
        mem_array[337] <= 8'hc5;
        mem_array[338] <= 8'hd5;
        mem_array[339] <= 8'he5;
        mem_array[340] <= 8'hf0;
        mem_array[341] <= 8'ha0;
        mem_array[342] <= 8'he6;
        mem_array[343] <= 8'h07;
        mem_array[344] <= 8'h5f;
        mem_array[345] <= 8'h16;
        mem_array[346] <= 8'h00;
        mem_array[347] <= 8'h21;
        mem_array[348] <= 8'h70;
        mem_array[349] <= 8'h01;
        mem_array[350] <= 8'h19;
        mem_array[351] <= 8'h19;
        mem_array[352] <= 8'h2a;
        mem_array[353] <= 8'h0f;
        mem_array[354] <= 8'h6f;
        mem_array[355] <= 8'h11;
        mem_array[356] <= 8'h68;
        mem_array[357] <= 8'h01;
        mem_array[358] <= 8'hd5;
        mem_array[359] <= 8'he9;
        mem_array[360] <= 8'hcd;
        mem_array[361] <= 8'hfa;
        mem_array[362] <= 8'h1e;
        mem_array[363] <= 8'he1;
        mem_array[364] <= 8'hd1;
        mem_array[365] <= 8'hc1;
        mem_array[366] <= 8'hf1;
        mem_array[367] <= 8'hd9;
        mem_array[368] <= 8'h80;
        mem_array[369] <= 8'h01;
        mem_array[370] <= 8'hf4;
        mem_array[371] <= 8'h01;
        mem_array[372] <= 8'hb0;
        mem_array[373] <= 8'h02;
        mem_array[374] <= 8'hc4;
        mem_array[375] <= 8'h02;
        mem_array[376] <= 8'h55;
        mem_array[377] <= 8'h02;
        mem_array[378] <= 8'h78;
        mem_array[379] <= 8'h02;
        mem_array[380] <= 8'h80;
        mem_array[381] <= 8'h01;
        mem_array[382] <= 8'h80;
        mem_array[383] <= 8'h01;
        mem_array[384] <= 8'h21;
        mem_array[385] <= 8'h9d;
        mem_array[386] <= 8'hff;
        mem_array[387] <= 8'h04;
        mem_array[388] <= 8'hf0;
        mem_array[389] <= 8'h04;
        mem_array[390] <= 8'h47;
        mem_array[391] <= 8'hf0;
        mem_array[392] <= 8'he3;
        mem_array[393] <= 8'h88;
        mem_array[394] <= 8'he0;
        mem_array[395] <= 8'he3;
        mem_array[396] <= 8'hf0;
        mem_array[397] <= 8'h04;
        mem_array[398] <= 8'h47;
        mem_array[399] <= 8'hf0;
        mem_array[400] <= 8'he4;
        mem_array[401] <= 8'h98;
        mem_array[402] <= 8'he0;
        mem_array[403] <= 8'he4;
        mem_array[404] <= 8'hf0;
        mem_array[405] <= 8'h9f;
        mem_array[406] <= 8'hea;
        mem_array[407] <= 8'h55;
        mem_array[408] <= 8'hd1;
        mem_array[409] <= 8'hf0;
        mem_array[410] <= 8'hd1;
        mem_array[411] <= 8'he0;
        mem_array[412] <= 8'h43;
        mem_array[413] <= 8'hf0;
        mem_array[414] <= 8'hd2;
        mem_array[415] <= 8'he0;
        mem_array[416] <= 8'h42;
        mem_array[417] <= 8'hf0;
        mem_array[418] <= 8'hd4;
        mem_array[419] <= 8'he0;
        mem_array[420] <= 8'h4a;
        mem_array[421] <= 8'hf0;
        mem_array[422] <= 8'hd3;
        mem_array[423] <= 8'he0;
        mem_array[424] <= 8'h4b;
        mem_array[425] <= 8'hcd;
        mem_array[426] <= 8'h58;
        mem_array[427] <= 8'h14;
        mem_array[428] <= 8'h08;
        mem_array[429] <= 8'h14;
        mem_array[430] <= 8'hcd;
        mem_array[431] <= 8'hdf;
        mem_array[432] <= 8'h0b;
        mem_array[433] <= 8'h08;
        mem_array[434] <= 8'h0f;
        mem_array[435] <= 8'hcd;
        mem_array[436] <= 8'hbb;
        mem_array[437] <= 8'h14;
        mem_array[438] <= 8'hcd;
        mem_array[439] <= 8'hd0;
        mem_array[440] <= 8'h15;
        mem_array[441] <= 8'hcd;
        mem_array[442] <= 8'h79;
        mem_array[443] <= 8'h15;
        mem_array[444] <= 8'hcd;
        mem_array[445] <= 8'h2b;
        mem_array[446] <= 8'h16;
        mem_array[447] <= 8'hcd;
        mem_array[448] <= 8'h42;
        mem_array[449] <= 8'h16;
        mem_array[450] <= 8'hf0;
        mem_array[451] <= 8'hda;
        mem_array[452] <= 8'ha7;
        mem_array[453] <= 8'h20;
        mem_array[454] <= 8'h03;
        mem_array[455] <= 8'hcd;
        mem_array[456] <= 8'h80;
        mem_array[457] <= 8'hff;
        mem_array[458] <= 8'haf;
        mem_array[459] <= 8'hea;
        mem_array[460] <= 8'hea;
        mem_array[461] <= 8'hce;
        mem_array[462] <= 8'hfa;
        mem_array[463] <= 8'he8;
        mem_array[464] <= 8'hce;
        mem_array[465] <= 8'ha7;
        mem_array[466] <= 8'h28;
        mem_array[467] <= 8'h04;
        mem_array[468] <= 8'h3d;
        mem_array[469] <= 8'hea;
        mem_array[470] <= 8'he8;
        mem_array[471] <= 8'hce;
        mem_array[472] <= 8'hfa;
        mem_array[473] <= 8'he9;
        mem_array[474] <= 8'hce;
        mem_array[475] <= 8'ha7;
        mem_array[476] <= 8'h28;
        mem_array[477] <= 8'h04;
        mem_array[478] <= 8'h3d;
        mem_array[479] <= 8'hea;
        mem_array[480] <= 8'he9;
        mem_array[481] <= 8'hce;
        mem_array[482] <= 8'hcd;
        mem_array[483] <= 8'he6;
        mem_array[484] <= 8'h08;
        mem_array[485] <= 8'h3e;
        mem_array[486] <= 8'h3a;
        mem_array[487] <= 8'hd7;
        mem_array[488] <= 8'hcd;
        mem_array[489] <= 8'h5c;
        mem_array[490] <= 8'h40;
        mem_array[491] <= 8'hfa;
        mem_array[492] <= 8'h55;
        mem_array[493] <= 8'hd1;
        mem_array[494] <= 8'hd7;
        mem_array[495] <= 8'hf0;
        mem_array[496] <= 8'h9a;
        mem_array[497] <= 8'he0;
        mem_array[498] <= 8'he5;
        mem_array[499] <= 8'hc9;
        mem_array[500] <= 8'hf0;
        mem_array[501] <= 8'h9f;
        mem_array[502] <= 8'hea;
        mem_array[503] <= 8'h55;
        mem_array[504] <= 8'hd1;
        mem_array[505] <= 8'hf0;
        mem_array[506] <= 8'hd1;
        mem_array[507] <= 8'he0;
        mem_array[508] <= 8'h43;
        mem_array[509] <= 8'hf0;
        mem_array[510] <= 8'hd2;
        mem_array[511] <= 8'he0;
        mem_array[512] <= 8'h42;
        mem_array[513] <= 8'hcd;
        mem_array[514] <= 8'h3e;
        mem_array[515] <= 8'h02;
        mem_array[516] <= 8'h08;
        mem_array[517] <= 8'h09;
        mem_array[518] <= 8'hcd;
        mem_array[519] <= 8'hbb;
        mem_array[520] <= 8'h14;
        mem_array[521] <= 8'hcd;
        mem_array[522] <= 8'hd0;
        mem_array[523] <= 8'h15;
        mem_array[524] <= 8'hcd;
        mem_array[525] <= 8'h80;
        mem_array[526] <= 8'hff;
        mem_array[527] <= 8'hf0;
        mem_array[528] <= 8'hc8;
        mem_array[529] <= 8'hb7;
        mem_array[530] <= 8'h28;
        mem_array[531] <= 8'h05;
        mem_array[532] <= 8'h4f;
        mem_array[533] <= 8'hfa;
        mem_array[534] <= 8'h00;
        mem_array[535] <= 8'hc7;
        mem_array[536] <= 8'he2;
        mem_array[537] <= 8'haf;
        mem_array[538] <= 8'hea;
        mem_array[539] <= 8'hea;
        mem_array[540] <= 8'hce;
        mem_array[541] <= 8'hf0;
        mem_array[542] <= 8'h0f;
        mem_array[543] <= 8'h47;
        mem_array[544] <= 8'haf;
        mem_array[545] <= 8'he0;
        mem_array[546] <= 8'h0f;
        mem_array[547] <= 8'h3e;
        mem_array[548] <= 8'h02;
        mem_array[549] <= 8'he0;
        mem_array[550] <= 8'hff;
        mem_array[551] <= 8'h78;
        mem_array[552] <= 8'he6;
        mem_array[553] <= 8'h08;
        mem_array[554] <= 8'hf6;
        mem_array[555] <= 8'h02;
        mem_array[556] <= 8'he0;
        mem_array[557] <= 8'h0f;
        mem_array[558] <= 8'hfb;
        mem_array[559] <= 8'h3e;
        mem_array[560] <= 8'h3a;
        mem_array[561] <= 8'hd7;
        mem_array[562] <= 8'hcd;
        mem_array[563] <= 8'h5c;
        mem_array[564] <= 8'h40;
        mem_array[565] <= 8'hfa;
        mem_array[566] <= 8'h55;
        mem_array[567] <= 8'hd1;
        mem_array[568] <= 8'hd7;
        mem_array[569] <= 8'h3e;
        mem_array[570] <= 8'h1f;
        mem_array[571] <= 8'he0;
        mem_array[572] <= 8'hff;
        mem_array[573] <= 8'hc9;
        mem_array[574] <= 8'hf0;
        mem_array[575] <= 8'he8;
        mem_array[576] <= 8'ha7;
        mem_array[577] <= 8'hc2;
        mem_array[578] <= 8'he3;
        mem_array[579] <= 8'h0b;
        mem_array[580] <= 8'hfa;
        mem_array[581] <= 8'h43;
        mem_array[582] <= 8'hcf;
        mem_array[583] <= 8'he0;
        mem_array[584] <= 8'h47;
        mem_array[585] <= 8'hfa;
        mem_array[586] <= 8'h44;
        mem_array[587] <= 8'hcf;
        mem_array[588] <= 8'he0;
        mem_array[589] <= 8'h48;
        mem_array[590] <= 8'hfa;
        mem_array[591] <= 8'h45;
        mem_array[592] <= 8'hcf;
        mem_array[593] <= 8'he0;
        mem_array[594] <= 8'h49;
        mem_array[595] <= 8'ha7;
        mem_array[596] <= 8'hc9;
        mem_array[597] <= 8'hf0;
        mem_array[598] <= 8'h9f;
        mem_array[599] <= 8'hea;
        mem_array[600] <= 8'h55;
        mem_array[601] <= 8'hd1;
        mem_array[602] <= 8'hcd;
        mem_array[603] <= 8'hbb;
        mem_array[604] <= 8'h14;
        mem_array[605] <= 8'hcd;
        mem_array[606] <= 8'hd0;
        mem_array[607] <= 8'h15;
        mem_array[608] <= 8'hcd;
        mem_array[609] <= 8'h80;
        mem_array[610] <= 8'hff;
        mem_array[611] <= 8'hcd;
        mem_array[612] <= 8'he6;
        mem_array[613] <= 8'h08;
        mem_array[614] <= 8'haf;
        mem_array[615] <= 8'hea;
        mem_array[616] <= 8'hea;
        mem_array[617] <= 8'hce;
        mem_array[618] <= 8'hcd;
        mem_array[619] <= 8'hbf;
        mem_array[620] <= 8'h1e;
        mem_array[621] <= 8'h3e;
        mem_array[622] <= 8'h3a;
        mem_array[623] <= 8'hd7;
        mem_array[624] <= 8'hcd;
        mem_array[625] <= 8'h5c;
        mem_array[626] <= 8'h40;
        mem_array[627] <= 8'hfa;
        mem_array[628] <= 8'h55;
        mem_array[629] <= 8'hd1;
        mem_array[630] <= 8'hd7;
        mem_array[631] <= 8'hc9;
        mem_array[632] <= 8'hf0;
        mem_array[633] <= 8'h9f;
        mem_array[634] <= 8'hea;
        mem_array[635] <= 8'h55;
        mem_array[636] <= 8'hd1;
        mem_array[637] <= 8'hf0;
        mem_array[638] <= 8'hd1;
        mem_array[639] <= 8'he0;
        mem_array[640] <= 8'h43;
        mem_array[641] <= 8'hcd;
        mem_array[642] <= 8'hdf;
        mem_array[643] <= 8'h0b;
        mem_array[644] <= 8'h08;
        mem_array[645] <= 8'h06;
        mem_array[646] <= 8'hcd;
        mem_array[647] <= 8'hbb;
        mem_array[648] <= 8'h14;
        mem_array[649] <= 8'hcd;
        mem_array[650] <= 8'hd0;
        mem_array[651] <= 8'h15;
        mem_array[652] <= 8'haf;
        mem_array[653] <= 8'hea;
        mem_array[654] <= 8'hea;
        mem_array[655] <= 8'hce;
        mem_array[656] <= 8'hcd;
        mem_array[657] <= 8'he6;
        mem_array[658] <= 8'h08;
        mem_array[659] <= 8'haf;
        mem_array[660] <= 8'he0;
        mem_array[661] <= 8'h0f;
        mem_array[662] <= 8'h3e;
        mem_array[663] <= 8'h02;
        mem_array[664] <= 8'he0;
        mem_array[665] <= 8'hff;
        mem_array[666] <= 8'he0;
        mem_array[667] <= 8'h0f;
        mem_array[668] <= 8'hfb;
        mem_array[669] <= 8'h3e;
        mem_array[670] <= 8'h3a;
        mem_array[671] <= 8'hd7;
        mem_array[672] <= 8'hcd;
        mem_array[673] <= 8'h5c;
        mem_array[674] <= 8'h40;
        mem_array[675] <= 8'hfa;
        mem_array[676] <= 8'h55;
        mem_array[677] <= 8'hd1;
        mem_array[678] <= 8'hd7;
        mem_array[679] <= 8'hf3;
        mem_array[680] <= 8'haf;
        mem_array[681] <= 8'he0;
        mem_array[682] <= 8'h0f;
        mem_array[683] <= 8'h3e;
        mem_array[684] <= 8'h1f;
        mem_array[685] <= 8'he0;
        mem_array[686] <= 8'hff;
        mem_array[687] <= 8'hc9;
        mem_array[688] <= 8'hf0;
        mem_array[689] <= 8'h9f;
        mem_array[690] <= 8'hea;
        mem_array[691] <= 8'h55;
        mem_array[692] <= 8'hd1;
        mem_array[693] <= 8'h3e;
        mem_array[694] <= 8'h3a;
        mem_array[695] <= 8'hd7;
        mem_array[696] <= 8'hcd;
        mem_array[697] <= 8'h5c;
        mem_array[698] <= 8'h40;
        mem_array[699] <= 8'hfa;
        mem_array[700] <= 8'h55;
        mem_array[701] <= 8'hd1;
        mem_array[702] <= 8'hd7;
        mem_array[703] <= 8'haf;
        mem_array[704] <= 8'hea;
        mem_array[705] <= 8'hea;
        mem_array[706] <= 8'hce;
        mem_array[707] <= 8'hc9;
        mem_array[708] <= 8'hf0;
        mem_array[709] <= 8'h9d;
        mem_array[710] <= 8'h3c;
        mem_array[711] <= 8'he0;
        mem_array[712] <= 8'h9d;
        mem_array[713] <= 8'hf0;
        mem_array[714] <= 8'h04;
        mem_array[715] <= 8'h47;
        mem_array[716] <= 8'hf0;
        mem_array[717] <= 8'he3;
        mem_array[718] <= 8'h88;
        mem_array[719] <= 8'he0;
        mem_array[720] <= 8'he3;
        mem_array[721] <= 8'hf0;
        mem_array[722] <= 8'h04;
        mem_array[723] <= 8'h47;
        mem_array[724] <= 8'hf0;
        mem_array[725] <= 8'he4;
        mem_array[726] <= 8'h98;
        mem_array[727] <= 8'he0;
        mem_array[728] <= 8'he4;
        mem_array[729] <= 8'hcd;
        mem_array[730] <= 8'he6;
        mem_array[731] <= 8'h08;
        mem_array[732] <= 8'hf0;
        mem_array[733] <= 8'h9f;
        mem_array[734] <= 8'hea;
        mem_array[735] <= 8'h55;
        mem_array[736] <= 8'hd1;
        mem_array[737] <= 8'hf0;
        mem_array[738] <= 8'hd1;
        mem_array[739] <= 8'he0;
        mem_array[740] <= 8'h43;
        mem_array[741] <= 8'hf0;
        mem_array[742] <= 8'hd2;
        mem_array[743] <= 8'he0;
        mem_array[744] <= 8'h42;
        mem_array[745] <= 8'hf0;
        mem_array[746] <= 8'hd4;
        mem_array[747] <= 8'he0;
        mem_array[748] <= 8'h4a;
        mem_array[749] <= 8'hf0;
        mem_array[750] <= 8'hd3;
        mem_array[751] <= 8'he0;
        mem_array[752] <= 8'h4b;
        mem_array[753] <= 8'hcd;
        mem_array[754] <= 8'hbb;
        mem_array[755] <= 8'h14;
        mem_array[756] <= 8'hcd;
        mem_array[757] <= 8'h58;
        mem_array[758] <= 8'h14;
        mem_array[759] <= 8'hcd;
        mem_array[760] <= 8'hd0;
        mem_array[761] <= 8'h15;
        mem_array[762] <= 8'hcd;
        mem_array[763] <= 8'h79;
        mem_array[764] <= 8'h15;
        mem_array[765] <= 8'hcd;
        mem_array[766] <= 8'h2b;
        mem_array[767] <= 8'h16;
        mem_array[768] <= 8'hcd;
        mem_array[769] <= 8'h80;
        mem_array[770] <= 8'hff;
        mem_array[771] <= 8'haf;
        mem_array[772] <= 8'hea;
        mem_array[773] <= 8'hea;
        mem_array[774] <= 8'hce;
        mem_array[775] <= 8'hfa;
        mem_array[776] <= 8'he9;
        mem_array[777] <= 8'hce;
        mem_array[778] <= 8'ha7;
        mem_array[779] <= 8'h28;
        mem_array[780] <= 8'h04;
        mem_array[781] <= 8'h3d;
        mem_array[782] <= 8'hea;
        mem_array[783] <= 8'he9;
        mem_array[784] <= 8'hce;
        mem_array[785] <= 8'haf;
        mem_array[786] <= 8'he0;
        mem_array[787] <= 8'h0f;
        mem_array[788] <= 8'h3e;
        mem_array[789] <= 8'h02;
        mem_array[790] <= 8'he0;
        mem_array[791] <= 8'hff;
        mem_array[792] <= 8'he0;
        mem_array[793] <= 8'h0f;
        mem_array[794] <= 8'hfb;
        mem_array[795] <= 8'h3e;
        mem_array[796] <= 8'h3a;
        mem_array[797] <= 8'hd7;
        mem_array[798] <= 8'hcd;
        mem_array[799] <= 8'h5c;
        mem_array[800] <= 8'h40;
        mem_array[801] <= 8'hfa;
        mem_array[802] <= 8'h55;
        mem_array[803] <= 8'hd1;
        mem_array[804] <= 8'hd7;
        mem_array[805] <= 8'hf3;
        mem_array[806] <= 8'haf;
        mem_array[807] <= 8'he0;
        mem_array[808] <= 8'h0f;
        mem_array[809] <= 8'h3e;
        mem_array[810] <= 8'h1f;
        mem_array[811] <= 8'he0;
        mem_array[812] <= 8'hff;
        mem_array[813] <= 8'hc9;
        mem_array[814] <= 8'h3e;
        mem_array[815] <= 8'h01;
        mem_array[816] <= 8'hea;
        mem_array[817] <= 8'hea;
        mem_array[818] <= 8'hce;
        mem_array[819] <= 8'h76;
        mem_array[820] <= 8'h00;
        mem_array[821] <= 8'hfa;
        mem_array[822] <= 8'hea;
        mem_array[823] <= 8'hce;
        mem_array[824] <= 8'ha7;
        mem_array[825] <= 8'h20;
        mem_array[826] <= 8'hf8;
        mem_array[827] <= 8'hc9;
        mem_array[828] <= 8'hcd;
        mem_array[829] <= 8'h2e;
        mem_array[830] <= 8'h03;
        mem_array[831] <= 8'h0d;
        mem_array[832] <= 8'h20;
        mem_array[833] <= 8'hfa;
        mem_array[834] <= 8'hc9;
        mem_array[835] <= 8'hfa;
        mem_array[836] <= 8'hcd;
        mem_array[837] <= 8'hc1;
        mem_array[838] <= 8'hfe;
        mem_array[839] <= 8'h00;
        mem_array[840] <= 8'hc8;
        mem_array[841] <= 8'hcd;
        mem_array[842] <= 8'h67;
        mem_array[843] <= 8'h04;
        mem_array[844] <= 8'hfa;
        mem_array[845] <= 8'he5;
        mem_array[846] <= 8'hcf;
        mem_array[847] <= 8'hcb;
        mem_array[848] <= 8'h47;
        mem_array[849] <= 8'hc8;
        mem_array[850] <= 8'h21;
        mem_array[851] <= 8'h0f;
        mem_array[852] <= 8'h43;
        mem_array[853] <= 8'h3e;
        mem_array[854] <= 8'h23;
        mem_array[855] <= 8'hcf;
        mem_array[856] <= 8'hc9;
        mem_array[857] <= 8'h21;
        mem_array[858] <= 8'h97;
        mem_array[859] <= 8'h43;
        mem_array[860] <= 8'h3e;
        mem_array[861] <= 8'h23;
        mem_array[862] <= 8'hcf;
        mem_array[863] <= 8'hc9;
        mem_array[864] <= 8'hfa;
        mem_array[865] <= 8'h68;
        mem_array[866] <= 8'hd5;
        mem_array[867] <= 8'h47;
        mem_array[868] <= 8'h21;
        mem_array[869] <= 8'h0c;
        mem_array[870] <= 8'h04;
        mem_array[871] <= 8'h7d;
        mem_array[872] <= 8'h90;
        mem_array[873] <= 8'h6f;
        mem_array[874] <= 8'h00;
        mem_array[875] <= 8'h01;
        mem_array[876] <= 8'h25;
        mem_array[877] <= 8'h2a;
        mem_array[878] <= 8'he0;
        mem_array[879] <= 8'h47;
        mem_array[880] <= 8'h2a;
        mem_array[881] <= 8'he0;
        mem_array[882] <= 8'h48;
        mem_array[883] <= 8'h2a;
        mem_array[884] <= 8'he0;
        mem_array[885] <= 8'h49;
        mem_array[886] <= 8'hc9;
        mem_array[887] <= 8'hf0;
        mem_array[888] <= 8'he8;
        mem_array[889] <= 8'ha7;
        mem_array[890] <= 8'h28;
        mem_array[891] <= 8'h07;
        mem_array[892] <= 8'h21;
        mem_array[893] <= 8'heb;
        mem_array[894] <= 8'h03;
        mem_array[895] <= 8'h06;
        mem_array[896] <= 8'h04;
        mem_array[897] <= 8'h18;
        mem_array[898] <= 8'h18;
        mem_array[899] <= 8'h21;
        mem_array[900] <= 8'h03;
        mem_array[901] <= 8'h04;
        mem_array[902] <= 8'h06;
        mem_array[903] <= 8'h04;
        mem_array[904] <= 8'h18;
        mem_array[905] <= 8'h11;
        mem_array[906] <= 8'hf0;
        mem_array[907] <= 8'he8;
        mem_array[908] <= 8'ha7;
        mem_array[909] <= 8'h28;
        mem_array[910] <= 8'h07;
        mem_array[911] <= 8'h21;
        mem_array[912] <= 8'hfa;
        mem_array[913] <= 8'h03;
        mem_array[914] <= 8'h06;
        mem_array[915] <= 8'h03;
        mem_array[916] <= 8'h18;
        mem_array[917] <= 8'h05;
        mem_array[918] <= 8'h21;
        mem_array[919] <= 8'h12;
        mem_array[920] <= 8'h04;
        mem_array[921] <= 8'h06;
        mem_array[922] <= 8'h03;
        mem_array[923] <= 8'hd5;
        mem_array[924] <= 8'h2a;
        mem_array[925] <= 8'hcd;
        mem_array[926] <= 8'h0a;
        mem_array[927] <= 8'h0c;
        mem_array[928] <= 8'h2a;
        mem_array[929] <= 8'h5f;
        mem_array[930] <= 8'h2a;
        mem_array[931] <= 8'h57;
        mem_array[932] <= 8'hcd;
        mem_array[933] <= 8'h83;
        mem_array[934] <= 8'h0c;
        mem_array[935] <= 8'h0e;
        mem_array[936] <= 8'h08;
        mem_array[937] <= 8'hcd;
        mem_array[938] <= 8'h3c;
        mem_array[939] <= 8'h03;
        mem_array[940] <= 8'hd1;
        mem_array[941] <= 8'h05;
        mem_array[942] <= 8'h20;
        mem_array[943] <= 8'heb;
        mem_array[944] <= 8'hc9;
        mem_array[945] <= 8'hf0;
        mem_array[946] <= 8'he8;
        mem_array[947] <= 8'ha7;
        mem_array[948] <= 8'h28;
        mem_array[949] <= 8'h07;
        mem_array[950] <= 8'h21;
        mem_array[951] <= 8'hf6;
        mem_array[952] <= 8'h03;
        mem_array[953] <= 8'h06;
        mem_array[954] <= 8'h04;
        mem_array[955] <= 8'h18;
        mem_array[956] <= 8'h18;
        mem_array[957] <= 8'h21;
        mem_array[958] <= 8'h0e;
        mem_array[959] <= 8'h04;
        mem_array[960] <= 8'h06;
        mem_array[961] <= 8'h04;
        mem_array[962] <= 8'h18;
        mem_array[963] <= 8'h11;
        mem_array[964] <= 8'hf0;
        mem_array[965] <= 8'he8;
        mem_array[966] <= 8'ha7;
        mem_array[967] <= 8'h28;
        mem_array[968] <= 8'h07;
        mem_array[969] <= 8'h21;
        mem_array[970] <= 8'hff;
        mem_array[971] <= 8'h03;
        mem_array[972] <= 8'h06;
        mem_array[973] <= 8'h03;
        mem_array[974] <= 8'h18;
        mem_array[975] <= 8'h05;
        mem_array[976] <= 8'h21;
        mem_array[977] <= 8'h17;
        mem_array[978] <= 8'h04;
        mem_array[979] <= 8'h06;
        mem_array[980] <= 8'h03;
        mem_array[981] <= 8'hd5;
        mem_array[982] <= 8'h3a;
        mem_array[983] <= 8'h57;
        mem_array[984] <= 8'h3a;
        mem_array[985] <= 8'h5f;
        mem_array[986] <= 8'hcd;
        mem_array[987] <= 8'h83;
        mem_array[988] <= 8'h0c;
        mem_array[989] <= 8'h3a;
        mem_array[990] <= 8'hcd;
        mem_array[991] <= 8'h0a;
        mem_array[992] <= 8'h0c;
        mem_array[993] <= 8'h0e;
        mem_array[994] <= 8'h08;
        mem_array[995] <= 8'hcd;
        mem_array[996] <= 8'h3c;
        mem_array[997] <= 8'h03;
        mem_array[998] <= 8'hd1;
        mem_array[999] <= 8'h05;
		
		for (integer i = 16; i <= size - 1; i = i + 1)		// Assign the rest of the memory to 0
			begin
				mem_array[i] <= 8'h0;
			end
		end
   end
   assign I_O = I_O_wire;
	  
endmodule