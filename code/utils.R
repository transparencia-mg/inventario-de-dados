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


read_all <- function(path, pattern = "[.]csv$", exclude = NULL, fun, ...) {
  
  files <- list.files(path, pattern = pattern, full.names = FALSE) %>% 
            setdiff(exclude)
  
  filenames <- str_remove_all(files, pattern)
  
  return <- file.path(path, files) %>% 
            purrr::map(fun, ...) %>% 
            magrittr::set_names(filenames)
  return
}