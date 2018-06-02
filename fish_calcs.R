

#-- most frequently caught fish in each location

#-- total revenue for each location

#-- total fisheries revenue sum

#-- if user requests it graph of revenue by location and total revenue (as text)


fish_calcs = function(table, priceTab, plot = FALSE) {

  #Add names
  table$fish_name = rownames(table)
  
  #Catch = 
  Majority_Fish = apply(table, 2, which.max)

  #Reorganize catch table:
  table_reordered =  gather(table, key = "Location", value = "Catch", -fish_name)
  
  #Join tables
  table_combo = full_join(table_reordered, priceTab)
  table_combo = table_combo %>% 
    mutate(Ind_Revenue = Catch * Price)
  
  #Revenue per Location
  table_rev_loc = table_combo %>% 
    group_by(Location) %>% 
    summarize_at(vars(Ind_Revenue), sum) %>% 
    rename(Revenue = Ind_Revenue)
  
  #Overall Revenue
  total_revenue = sum(table_rev_loc$Revenue)
  
  #Optional Graph
  if (plot) {
    lb = sprintf("The total revenue is %s dollars", total_revenue)
    p = ggplot(table_rev_loc, aes(Location, Revenue, fill=Location))+
      geom_col(show.legend = F)+
      labs(y="Revenue ($)")+
      annotate("text", x=4, y=1000, label=lb, col="red")+
      theme_classic()
  }
  else p=NULL

  return(list(Majority_Fish, 
              "Total Revenue at each Location" = table_rev_loc, 
              "Overall Catch Revenue" = total_revenue, p))

}
