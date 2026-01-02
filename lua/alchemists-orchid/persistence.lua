-- Persistence Module
-- Handles saving and loading theme preferences across sessions

local M = {}

-- Get the default cache path (follows XDG spec)
local function get_cache_path()
  local cache_dir = vim.fn.stdpath('cache') .. '/alchemists-orchid'
  return cache_dir .. '/theme.json'
end

-- Ensure cache directory exists
local function ensure_cache_dir()
  local cache_dir = vim.fn.stdpath('cache') .. '/alchemists-orchid'
  if vim.fn.isdirectory(cache_dir) == 0 then
    vim.fn.mkdir(cache_dir, 'p')
  end
end

-- Save current theme mode to cache
function M.save(mode, opts)
  opts = opts or {}
  local path = opts.path or get_cache_path()
  
  ensure_cache_dir()
  
  local data = vim.fn.json_encode({ mode = mode })
  local file = io.open(path, 'w')
  if file then
    file:write(data)
    file:close()
    return true
  end
  return false
end

-- Load saved theme mode from cache
function M.load(opts)
  opts = opts or {}
  local path = opts.path or get_cache_path()
  
  local file = io.open(path, 'r')
  if file then
    local content = file:read('*a')
    file:close()
    local ok, data = pcall(vim.fn.json_decode, content)
    if ok and data and data.mode then
      return data.mode
    end
  end
  return nil
end

-- Clear saved theme preference
function M.clear(opts)
  opts = opts or {}
  local path = opts.path or get_cache_path()
  
  if vim.fn.filereadable(path) == 1 then
    vim.fn.delete(path)
    return true
  end
  return false
end

return M
