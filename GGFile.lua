local GGFile = {}
local GGFile_mt = { __index = GGFile }

local lfs = require( "lfs" )

GGFile.Attribute = {}
GGFile.Attribute.Dev = "dev"
GGFile.Attribute.Inode = "ino"
GGFile.Attribute.Mode = "mode"
GGFile.Attribute.HardLinks = "nlink"
GGFile.Attribute.UID = "uid"
GGFile.Attribute.GID = "gid"
GGFile.Attribute.RDev = "rdev"
GGFile.Attribute.LastAccess = "access"
GGFile.Attribute.LastModification = "modification"
GGFile.Attribute.LastChange = "change"
GGFile.Attribute.Size = "size"
GGFile.Attribute.Blocks = "blocks"
GGFile.Attribute.BlockSize = "blksize"
GGFile.Attribute.Permissions = "permissions"

function GGFile:new()
	local self = {}
	setmetatable( self, GGFile_mt )
	return self
end

function GGFile:read( path, baseDir )
	path = system.pathForFile( path, baseDir, or system.DocumentsDirectory )

	local file = io.open( path, "r" )
	if file then
		local data = file:read( "*a" )
		io.close( file )
		return data
	end
end

function GGFile:readBinary( path, baseDir )
	path = system.pathForFile( path, baseDir, or system.DocumentsDirectory )

	local file = io.open( path, "rb" )
	if file then
		local data = file:read( "*all" )
		io.close( file )
		return data
	end
end

function GGFile:readLines( path, baseDir )
	path = system.pathForFile( path, baseDir, or system.DocumentsDirectory )

	local file = io.open( path, "r" )
	if file then
		local lines = {}
		for line in file:lines() do
			lines[ #lines + 1 ] = line
		end
		io.close( file )
		return lines
	end
end

function GGFile:write( path, data, baseDir )
	path = system.pathForFile( path, baseDir, or system.DocumentsDirectory )

	local file = io.open( path, "w" )
	if file then
		file:write( data )
		io.close( file )
		file = nil
	end
end

function GGFile:writeBinary( path,data, baseDir )
	path = system.pathForFile( path, baseDir, or system.DocumentsDirectory )

	local file = io.open( path, "wb" )
	if file then
		file:write( data )
		io.close( file )
		file = nil
	end
end

function GGFile:append( path, data, baseDir )
	path = system.pathForFile( path, baseDir or system.DocumentsDirectory )
	
	local file = io.open( path, "a" )
	
	if file then
		file:write( data )
		io.close( file )
		file = nil
	end
	
end

function GGFile:delete( path, baseDir )
	path = system.pathForFile( path, baseDir or system.DocumentsDirectory )
	return os.remove( path )
end

function GGFile:copy( sourcePath, sourceBaseDir, destinationPath, destinationBaseDir )
	local data = self:read( sourcePath, sourceBaseDir )
	self:write( destinationPath, data, destinationBaseDir)
end

function GGFile:copyBinary( sourcePath, sourceBaseDir, destinationPath, destinationBaseDir )
	local data = self:readBinary( sourcePath, sourceBaseDir )
	self:writeBinary( destinationPath, data, destinationBaseDir )
end

function GGFile:move( sourcePath, sourceBaseDir, destinationPath, destinationBaseDir )
	self:copy( sourcePath, sourceBaseDir, destinationPath, destinationBaseDir )
	self:delete( sourcePath, sourceBaseDir )
end

function GGFile:moveBinary( sourcePath, sourceBaseDir, destinationPath, destinationBaseDir )
	self:copyBinary( sourcePath, sourceBaseDir, destinationPath, destinationBaseDir )
	self:delete( sourcePath, sourceBaseDir )
end

function GGFile:rename( path, newName, baseDir )
	path = system.pathForFile( path, baseDir or system.DocumentsDirectory )
	newName = system.pathForFile( newName, baseDir or system.DocumentsDirectory )
	return os.rename( path, newName )
end

function GGFile:exists( path, baseDir )
	local mode = self:getAttributes( path, GGFile.Attribute.Mode, baseDir )
	return mode == "file" or mode == "directory"
end

function GGFile:isDirectory( path, baseDir )
	return self:getAttributes( path, GGFile.Attribute.Mode, baseDir ) == "directory"
end

function GGFile:getFilesInDirectory( path, baseDir )
	path = system.pathForFile( path, baseDir or system.DocumentsDirectory )

	if path then		
		local files = {}		
		for file in lfs.dir( path ) do		
			if file ~= "." and file ~= ".." and file ~= ".DS_Store" then
				files[ #files + 1 ] = file
			end			
		end
		return files		
	end	
end

function GGFile:makeDirectory( path, newDirectory, baseDir )
	path = system.pathForFile( path, baseDir or system.DocumentsDirectory )

	if lfs.chdir( path ) then
		local success, reason = lfs.mkdir( newDirectory )
		return success, reason
	end

	return false, "Parent directory doesn't exist."	
end

function GGFile:removeDirectory( path, baseDir )
	path = system.pathForFile( path, baseDir or system.DocumentsDirectory )

	return lfs.rmdir( path )	
end

function GGFile:getAttributes( path, attribute, baseDir )
	path = system.pathForFile( path, baseDir or system.DocumentsDirectory )
	
	if not path then
		return nil
	end
	
	return lfs.attributes( path, attribute )	
end

--- Destroys this GGFile object.
function GGFile:destroy()

end

return GGFile
