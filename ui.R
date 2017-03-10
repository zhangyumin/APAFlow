library(shiny)

shinyUI(navbarPage("APAFlow",
                    navbarMenu("预处理",
                      tabPanel("GFF格式化"),
                      tabPanel("SAM文件转换为PA坐标"),
                      tabPanel("去除internal priming"),
                      tabPanel("聚类PAT"),
                      tabPanel("统计PAC"),
                      tabPanel("过滤"),
                      tabPanel("标准化"),
                      tabPanel("PAC诊断")
                    ),
                    navbarMenu("PAS分析",
                      tabPanel("提取序列"),
                      tabPanel("单核苷分布"),
                      tabPanel("联子分析"),
                      tabPanel("信号分析")
                    ),
                    navbarMenu("PAC分析",
                      tabPanel("分类PAC"),
                      tabPanel("DE PAC"),
                      tabPanel("APA Switching"),
                      tabPanel("3UTR长度")
                    ),
                    navbarMenu("功能分析",
                      tabPanel("go PAC")
                    )
))