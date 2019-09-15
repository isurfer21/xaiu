require('src.lib.luash')
require('src.lib.ash')

local src = 'src'
local bin = 'bin'
local pkg = 'xaiu'

print('Remake bin/ dir')
if exists(bin) then
	rm('-rf', bin)
end
mkdir(bin)

print('Copy payload in bin/ dir')
cp('-r', src..'/payload', bin)

print('Compile setup')
ash('cd '..src..' && lua ../amalg -o ../'..bin..'/tmp.lua -s ./setup.lua lib.luash lib.ash')
luac('-o', bin..'/setup', bin..'/tmp.lua')
rm(bin..'/tmp.lua')

print('Zip package for distribution')
local pkz = pkg..'.zip'
if exists(pkz) then
	rm(pkz)
end
cp('-r', bin, pkg)
zip('-r', pkz, pkg)
rm('-rf', pkg)
