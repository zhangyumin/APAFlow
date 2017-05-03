library(shinydashboard)
library(rjson)

# 加载script文件夹内所有R脚本
lapply(list.files("script/", pattern = "[.][rR]$", recursive = TRUE, full.names = TRUE), source)

# 加载配置文件
config<-fromJSON(file="config.json")

function(input, output, session) {
  observeEvent(input$parse_gff_submit, {
    output$parse_gff_text <- renderText({
      paste("file size is:", input$parse_gff_file['size'],"<br>add 3utr is:", input$parse_gff_add3utr, "<br>expand 3utr is:", input$parse_gff_expand3utr, "<br>pm is:", input$parse_gff_pm);
    });
    a = input$parse_gff_add3utr
    b = input$parse_gff_expand3utr
    file = paste0(input$parse_gff_file['datapath'])
    result = mathops(a, b, file)
    output$parse_gff_td <- renderText({
      result
    })
    output$parse_gff_plot <- renderPlot({
      plot(mathops(a, b, file))
    })
  })
}