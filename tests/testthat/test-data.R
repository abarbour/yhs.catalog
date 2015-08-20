context('Dataset...')
test_that('tbl_df',{
	data(yhs)
	expect_is(yhs, 'tbl_df')
})
