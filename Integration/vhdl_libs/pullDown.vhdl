
	-----------------------------------------------------------------
	-- I2C slave etc.
	-----------------------------------------------------------------
	i2c_slave_mem_inst: I2CSLAVEMEM
			port map (MCLK => clk,
					nRST => reset_sync_n,
					SDA_IN => I2C_SDA_RESOLVED,
					SCL_IN => I2C_SCL_RESOLVED,
					SDA_OUT => I2C_SDA_SLAVE_OUT,
					SCL_OUT => I2C_SCL_SLAVE_OUT);

	I2C_SDA_RESOLVED <= (not I2C_SDA_PULL_DOWN) and I2C_SDA_SLAVE_OUT;
	I2C_SCL_RESOLVED <= (not I2C_SCL_PULL_DOWN) and I2C_SCL_SLAVE_OUT;

