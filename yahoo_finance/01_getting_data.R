library(tidyverse)
library(tidyquant)


df_reit <- 
    read_csv("arthur_reit_list.csv")

#df_reit$Symbol    

ix <- 1
lst_px = list()
for (ix_ticker in df_reit$Symbol){
    df_px <- 
        # tq_get(
        #     df_reit$Symbol[[ix_ticker]], get = "stock.prices"
        #     , from = "1900-01-01", to = "2020-02-01"
        # )
        tq_get(
            ix_ticker, get = "stock.prices"
            , from = "1900-01-01", to = "2020-02-01"
        )
    # df_px
    # print(nrow(df_px))
    if (is.data.frame(df_px)){
        lst_px[[length(lst_px) + 1]] <- df_px   
    }
    print(paste0(ix_ticker, ": " , ix, " ", nrow(df_px)))
    ix <- ix + 1
}

# df_px <- 
#     tq_get(
#         "FCRE", get = "stock.prices"
#         , from = "1900-01-01", to = "2020-02-01"
#     )



df_all <- bind_rows(lst_px)
df_all
# 
# 
# length(lst_px)lst_px[[1]]
# 
# lst_px[[1]]
# 
# lst_px[10]

# is.data.frame(lst_px[[1]])
# length(lst_px)
# lst_px[[1]]
