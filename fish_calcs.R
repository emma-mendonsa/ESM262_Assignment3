

#-- most frequently caught fish in each location

#-- total revenue for each location

#-- total fisheries revenue sum

#-- if user requests it graph of revenue by location and total revenue (as text)


fish_calcs = function(fish, table) {

  Catch = apply(table, 2, max)
  Fish = rownames(table)[apply(table, 2, which.max)]

  #Revenue = Fish * price$
  
  combo = as.data.frame(rbind(Fish, Catch))
  #max_catch = as.data.frame(rbind(fish, apply(table, 1, max) ))
  #  return(max_catch)
  return(combo)

}
