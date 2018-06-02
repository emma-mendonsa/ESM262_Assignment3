test_that("fish for simple test",
            {table = cbind(rep(0, times = 5), rep(0, times = 5));
                                             
  expect_that((fish_calcs(table = table)$Catch[1]), equals(0))
})

