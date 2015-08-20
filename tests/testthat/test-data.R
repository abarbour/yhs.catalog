context('Main dataset...')

data(yhs)
yhs.sub <- salton_trough_yhs()

test_that('class is tbl_df',{
	expect_is(yhs, 'tbl_df')
  expect_is(yhs.sub, 'tbl_df')
})

context('Boundaries...')

test_that('Latitudes',{
  expect_true(max(yhs.sub$Lat.deg) >= 32.5)
  expect_true(max(yhs.sub$Lat.deg) <= 33.7)
})
test_that('Longitudes',{
  expect_true(min(yhs.sub$Lon.deg) >= -116.3)
  expect_true(max(yhs.sub$Lon.deg) <= -115.1)
})