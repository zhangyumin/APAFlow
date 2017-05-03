library(shinydashboard)
library(rjson)

config<-fromJSON(file="config.json")

item_detail_index <- 1
item_detail_list <- list()
# 加载sidebar数据信息
menu_index <- 1
menu_list <- list()
for(menu in config$menuitem){
  submenu_index <- 1
  submenu_list <- list()
  for(submenu in menu$menusubitem){
    # options选项加载
    option_index <- 1
    option_list <- list()
    for(option in submenu$option){
      if(option$type == "fileinput"){
        option_list[[option_index]] <- fileInput(paste0(submenu$tabname, "_", option$id), option$name, multiple = option$multiple, accept = NULL, width = NULL)
      }else if(option$type == "numericinput"){
        option_list[[option_index]] <- numericInput(paste0(submenu$tabname, "_", option$id), option$name, option$default)
      }else if(option$type == "actionbutton"){
        option_list[[option_index]] <- actionButton(paste0(submenu$tabname, "_", option$id), option$name)
      }else if(option$type == "selectinput"){
        select_choices <- option$choice
        option_list[[option_index]] <- selectInput(paste0(submenu$tabname, "_", option$id), option$name, select_choices)
      }
      option_index <- option_index + 1
    }
    # results面板加载
    result_index <- 1
    result_list <- list()
    for(result in submenu$result){
      if(result$type == "htmloutput"){
        result_list[[result_index]] <- htmlOutput(paste0(submenu$tabname, "_", result$id))
      }else if(result$type == "plotoutput"){
        result_list[[result_index]] <- plotOutput(paste0(submenu$tabname, "_", result$id))
      }
      result_index <- result_index + 1
    }
    submenu_list[[submenu_index]] <- menuSubItem(submenu$name, tabName = submenu$tabname)
    submenu_index <- submenu_index + 1
    item_detail_list[[item_detail_index]] <- tabItem(tabName = submenu$tabname, fluidRow(box(width = 4, status = "info", solidHeader = TRUE, title = "Options", option_list), box(width = 8, status = "info", solidHeader = TRUE, title = "Results", result_list)))
    item_detail_index <- item_detail_index + 1
  }
  menu_list[[menu_index]] <- menuItem(menu$name, tabName = menu$tabname, icon = icon(menu$icon), submenu_list)
  menu_index <- menu_index + 1
}

# sidebar初始化
sidebar <- dashboardSidebar(
  do.call(sidebarMenu, menu_list)
)

# body初始化
body <- dashboardBody(
  do.call(tabItems, item_detail_list)
)

# 整体页面初始化
dashboardPage(
  skin = config$skin,
  dashboardHeader(title = config$title),
  sidebar,
  body
)

