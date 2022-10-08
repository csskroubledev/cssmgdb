MongoDB = {
    Async = {},
    Sync = {}
} 

MongoDB.ready = function(cb) 
    AddEventHandler("cssmgdb:ready", function() 
        cb()
    end)
end

MongoDB.Sync.find = function(collection, filter) 
    local callback = nil
    TriggerEvent("cssmgdb:find", collection, filter, function(cb) 
        callback = cb
    end)
    while callback == nil do
        Wait(20)
    end
    return callback
end

MongoDB.Sync.findOne = function(collection, filter) 
    local callback = nil
    TriggerEvent("cssmgdb:findOne", collection, filter, function(cb) 
        callback = cb
    end)
    while callback == nil do
        Wait(20)
    end
    return callback
end

MongoDB.Sync.findOneAndUpdate = function(collection, filter, updateFilter) 
    local callback = nil
    TriggerEvent("cssmgdb:findOneAndUpdate", collection, filter, updateFilter, function(cb) 
        callback = cb
    end)
    while callback == nil do
        Wait(20)
    end
    return callback
end

MongoDB.Sync.findOneAndReplace = function(collection, filter, newObject) 
    local callback = nil
    TriggerEvent("cssmgdb:findOneAndReplace", collection, filter, newObject, function(cb) 
        callback = cb
    end)
    while callback == nil do
        Wait(20)
    end
    return callback
end

MongoDB.Sync.findOneAndDelete = function(collection, filter) 
    local callback = nil
    TriggerEvent("cssmgdb:findOneAndDelete", collection, filter, function(cb) 
        callback = cb
    end)
    while callback == nil do
        Wait(20)
    end
    return callback
end

MongoDB.Sync.replaceOne = MongoDB.Sync.findOneAndReplace

MongoDB.Sync.deleteOne = MongoDB.Sync.findOneAndDelete

MongoDB.Sync.insertOne = function(collection, object) 
    local callback = nil
    TriggerEvent("cssmgdb:insertOne", collection, object, function(cb) 
        callback = cb
    end)
    while callback == nil do
        Wait(20)
    end
    return callback
end

MongoDB.Sync.insertMany = function(collection, objects) 
    local callback = nil
    TriggerEvent("cssmgdb:insertMany", collection, objects, function(cb) 
        callback = cb
    end)
    while callback == nil do
        Wait(20)
    end
    return callback
end

-- Async

MongoDB.Async.find = function(collection, filter, callback) 
    TriggerEvent("cssmgdb:find", collection, filter, function(cb) 
        callback(cb)
    end)
end

MongoDB.Async.findOne = function(collection, filter, callback) 
    TriggerEvent("cssmgdb:findOne", collection, filter, function(cb) 
        callback(cb)
    end)
end

MongoDB.Async.findOneAndUpdate = function(collection, filter, updateFilter, callback) 
    TriggerEvent("cssmgdb:findOneAndUpdate", collection, filter, updateFilter, function(cb) 
        callback(cb)
    end)
end

MongoDB.Async.findOneAndReplace = function(collection, filter, newObject, callback) 
    TriggerEvent("cssmgdb:findOneAndReplace", collection, filter, newObject, function(cb) 
        callback(cb)
    end)
end

MongoDB.Async.findOneAndDelete = function(collection, filter, callback) 
    TriggerEvent("cssmgdb:findOneAndDelete", collection, filter, function(cb) 
        callback(cb)
    end)
end

MongoDB.Async.replaceOne = MongoDB.Async.findOneAndDelete

MongoDB.Async.deleteOne = MongoDB.Async.findOneAndDelete

MongoDB.Async.insertOne = function(collection, object, callback) 
    TriggerEvent("cssmgdb:insertOne", collection, object, function(cb) 
        callback(cb)
    end)
end

MongoDB.Async.insertMany = function(collection, objects, callback) 
    TriggerEvent("cssmgdb:insertMany", collection, objects, function(callback) 
        callback(cb)
    end)
end
