module item_encoder(
    input [39:0] item_no,
    output [4:0] item
    );
    
    /*
    Look-up table at
    https://docs.google.com/spreadsheets/d/1rPVAPtHMz8Ep4qkTgWe-0Ikh_MaeFy0dc-whBuFKERg/edit?usp=sharing
    */
    
    assign item [0] = item_no[3] | item_no[6] | item_no[12] | item_no[15] | item_no[16] | item_no[20] | item_no[23] | item_no[30] | item_no[33] | item_no[34] | item_no[39];
    assign item [1] = item_no[1] | item_no[2] | item_no[9] | item_no[38];
    assign item [2] = item_no[0] | item_no[8] | item_no[10] | item_no[27] | item_no[32] | item_no[35];
    assign item [3] = item_no[4] | item_no[5] | item_no[13] | item_no[18] | item_no[19] | item_no[25] | item_no[26] | item_no[37];
    assign item [4] = item_no[7] | item_no[11] | item_no[14] | item_no[17] | item_no[21] | item_no[22] | item_no[24] | item_no[28] | item_no[29] | item_no[31] | item_no[36];
    
endmodule
