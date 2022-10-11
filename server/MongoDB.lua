MongoDB = {
    Ready = false,
    ReadyCallbacks = {},
    Async = {},
    Sync = {},
    Connector = {}
} 

MongoDB.ready = function(cb) 
    MongoDB.Ready = true
    table.insert(MongoDB.ReadyCallbacks, cb)
    AddEventHandler("cssmgdb:ready", function() 
        cb()
    end)
end

CreateThread(function() 
    Wait(400)
    if MongoDB.Ready then return end
    MongoDB.Ready = true
    TriggerEvent("cssmgdb:verifyReady", function(b) 
        if b then
            for _,v in pairs(MongoDB.ReadyCallbacks) do
                v()
            end
        end
    end)
end)

MongoDB.Connector.CallSync = function(collection, funcName, data) 
    local callbackData
    TriggerEvent("cssmgdb:sync:connector", collection, funcName, data, function(data) 
        callbackData = data
    end)
    while callbackData == nil do 
        Wait(25)
    end
    return callbackData
end

MongoDB.Connector.CallAsync = function(collection, funcName, data, cb) 
    TriggerEvent("cssmgdb:async:connector", collection, funcName, data, cb)
end

MongoDB.Sync.find = function(collection, filter) 
    return MongoDB.Connector.CallSync(collection, 'find', {filter})
end

MongoDB.Sync.findOne = function(collection, filter) 
    return MongoDB.Connector.CallSync(collection, 'findOne', {filter})
end

MongoDB.Sync.findOneAndUpdate = function(collection, filter, updateFilter) 
    return MongoDB.Connector.CallSync(collection, 'findOneAndUpdate', {filter, updateFilter})
end

MongoDB.Sync.findOneAndReplace = function(collection, filter, newObject) 
    return MongoDB.Connector.CallSync(collection, 'findOneAndReplace', {filter, newObject})
end

MongoDB.Sync.findOneAndDelete = function(collection, filter) 
    return MongoDB.Connector.CallSync(collection, 'findOneAndDelete', {filter})
end

MongoDB.Sync.replaceOne = MongoDB.Sync.findOneAndReplace

MongoDB.Sync.deleteOne = MongoDB.Sync.findOneAndDelete

MongoDB.Sync.insertOne = function(collection, object) 
    return MongoDB.Connector.CallSync(collection, 'insertOne', {object})
end

MongoDB.Sync.insertMany = function(collection, objects) 
    return MongoDB.Connector.CallSync(collection, 'insertMany', {objects})
end

-- Async

MongoDB.Async.find = function(collection, filter, callback) 
    MongoDB.Connector.CallAsync(collection, 'find', {filter}, callback)
end

MongoDB.Async.findOne = function(collection, filter, callback) 
    MongoDB.Connector.CallAsync(collection, 'findOne', {filter}, callback)
end

MongoDB.Async.findOneAndUpdate = function(collection, filter, updateFilter, callback) 
    MongoDB.Connector.CallAsync(collection, 'findOneAndUpdate', {filter, updateFilter}, callback)
end

MongoDB.Async.findOneAndReplace = function(collection, filter, newObject, callback) 
    MongoDB.Connector.CallAsync(collection, 'findOneAndReplace', {filter, newObject}, callback)
end

MongoDB.Async.findOneAndDelete = function(collection, filter, callback) 
    MongoDB.Connector.CallAsync(collection, 'findOneAndDelete', {filter}, callback)
end

MongoDB.Async.replaceOne = MongoDB.Async.findOneAndDelete

MongoDB.Async.deleteOne = MongoDB.Async.findOneAndDelete

MongoDB.Async.insertOne = function(collection, object, callback) 
    MongoDB.Connector.CallAsync(collection, 'insertOne', {object}, callback)
end

MongoDB.Async.insertMany = function(collection, objects, callback) 
    MongoDB.Connector.CallAsync(collection, 'insertMany', {objects}, callback)
end
