class File_reader
    def readData(path)
        return JSON.load(File.open ( path))
    end    
end    