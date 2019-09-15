function ash(command)
  local handle = io.popen(command)
  local result = handle:read('*a')
  handle:close()
  return result
end

function S(...)
  return print(ash(string.format(...)))
end

function s(...)
  return ash(string.format(...))
end

function exists(name)
  if type(name)~="string" then 
    return false 
  end
  return os.rename(name, name) and true or false
end

function isFile(name)
  if type(name)~="string" then 
    return false 
  end
  if not exists(name) then 
    return false 
  end
  local f = io.open(name)
  if f then
    f:close()
    return true
  end
  return false
end