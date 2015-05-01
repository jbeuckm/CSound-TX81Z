
opcode GEN_W2, i, 0

    isize = ftlen(1)
    i_half_length = isize / 2
    i_quarter_length = isize / 4
    i_3_4_length = 3 * i_quarter_length

    iout_table  ftgen 0, 0, isize, 10, 1

    i_index = 0
    loop_start:

        iwrite_value = 0

        if (i_index < i_quarter_length) then
           iwrite_value tab_i i_index+i_3_4_length, 1
	   iwrite_value = iwrite_value + 1
	elseif (i_index < i_half_length) then
           iwrite_value tab_i i_index+i_quarter_length, 1
           iwrite_value = iwrite_value + 1
	elseif (i_index < i_3_4_length) then
	   iwrite_value tab_i i_index-i_quarter_length, 1
           iwrite_value = iwrite_value - 1
	elseif (i_index < isize) then
	   iwrite_value tab_i i_index-i_3_4_length, 1
	   iwrite_value = iwrite_value - 1
        endif

        tabw_i iwrite_value, i_index, iout_table

    loop_lt i_index, 1, isize, loop_start

;    prints "GEN_W2\n"
;    iout_test ftgen 0, 0, isize, 18, iout_table, 1, 0, isize

    xout iout_table
endop



opcode GEN_W4, i, 0

    isource_table GEN_W2

    isize = ftlen(isource_table)
    i_index = 0
    i_half_length = isize / 2

    iout_table  ftgen 0, 0, isize, 10, 0

    loop_start:

        iwrite_value = 0

        if (i_index < i_half_length) then
           iwrite_value tab_i i_index, isource_table
        endif

        tabw_i iwrite_value, i_index, iout_table

    loop_lt i_index, 1, isize, loop_start

    prints "GEN_W4\n"
    iout_test ftgen 0, 0, isize, 18, iout_table, 1, 0, isize

	      xout iout_table
endop


opcode GEN_W6, i, 0

    isource_table GEN_W2

    isize = ftlen(isource_table)
    i_index = 0
    i_half_length = isize / 2

    iout_table  ftgen 0, 0, isize, 10, 0

    loop_start:

        iwrite_value = 0

        if (i_index < i_half_length) then
           iwrite_value tab_i i_index*2, isource_table
        endif

	tabw_i iwrite_value, i_index, iout_table

    loop_lt i_index, 1, isize, loop_start

    prints "GEN_W6\n"
    iout_test ftgen 0, 0, isize, 18, iout_table, 1, 0, isize

              xout iout_table
endop


opcode GEN_W8, i, 0

    isource_table GEN_W2

    isize = ftlen(isource_table)
    i_index = 0
    i_half_length = isize / 2

    iout_table  ftgen 0, 0, isize, 10, 0

    loop_start:

        iwrite_value = 0

        if (i_index < i_half_length) then
           iwrite_value tab_i i_index*2, isource_table
        endif

	tabw_i abs(iwrite_value), i_index, iout_table

    loop_lt i_index, 1, isize, loop_start

    prints "GEN_W8\n"
    iout_test ftgen 0, 0, isize, 18, iout_table, 1, 0, isize

              xout iout_table
endop



opcode GEN_W1, i, 0

    isize = ftlen(1)

    iout_table  ftgen 0, 0, isize, 10, 1
    xout iout_table
endop


opcode GEN_W3, i, 0

    isize = ftlen(1)
    i_index = 0
    i_half_length = isize / 2

    iout_table  ftgen 0, 0, isize, 10, 1

    loop_start:

        iwrite_value = 0

        if (i_index < i_half_length) then
           iwrite_value tab_i i_index, 1
        endif

        tabw_i iwrite_value, i_index, iout_table

    loop_lt i_index, 1, isize, loop_start

    prints "GEN_W3\n"
    iout_test ftgen 0, 0, isize, 18, iout_table, 1, 0, isize

    xout iout_table
endop


opcode GEN_W5, i, 0

    isize = ftlen(1)
    i_index = 0
    i_half_length = isize / 2

    iout_table  ftgen 0, 0, isize, 10, 0, 1

    loop_start:

        iwrite_value = 0

        if (i_index < i_half_length) then
           iwrite_value tab_i i_index*2, 1
        endif

        tabw_i iwrite_value, i_index, iout_table

    loop_lt i_index, 1, isize, loop_start

    prints "GEN_W5\n"
    iout_test ftgen 0, 0, isize, 18, iout_table, 1, 0, isize

    xout iout_table
endop



opcode GEN_W7, i, 0

    isize = ftlen(1)
    i_index = 0
    i_half_length = isize / 2

    iout_table  ftgen 0, 0, isize, 10, 0, 1

    loop_start:

        iwrite_value = 0

        if (i_index < i_half_length) then
           iwrite_value tab_i i_index*2, 1
        endif

        tabw_i abs(iwrite_value), i_index, iout_table

    loop_lt i_index, 1, isize, loop_start

    prints "GEN_W7\n"
    iout_test ftgen 0, 0, isize, 18, iout_table, 1, 0, isize

    xout iout_table
endop




