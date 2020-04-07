check_dim <- function(x) {
  x %>% 
    map(dim) %>% 
    bind_rows() %>% 
    mutate(dim = c("rows", "columns")) %>% 
    as.data.table() %>% 
    melt(id.vars = "dim") %>% 
    dcast(variable ~ dim) %>% 
    mutate(rows = rows + 1) # para comparação com `wc -l`
}


read_all <- function(path, exclude = NULL, fun, ...) {
  
  files <- list.files(path, pattern = "[.]csv$", full.names = FALSE) %>% 
            setdiff(exclude)
  
  filenames <- str_remove_all(files, "[.]csv$")
  
  return <- file.path(path, files) %>% 
            purrr::map(fun, ...) %>% 
            magrittr::set_names(filenames)
  return
}