import axios from "axios"

export const GetAllUsers = async() => {
    let users
    users = await axios.get("http://localhost:4002/users")
    return users.data
}



export const AddUserServer = async(user) => {
    let users
    users = await axios.post("http://localhost:4002/user/register", user)
    return users.data
}

export const checkUserServer = async(user) => {
    debugger
    let users
    users = await axios.post("http://localhost:4002/user/login", user)
    return users.data
}

export const payProduct = async(prod) => {
    debugger
    let p
    p = await axios.put(`http://localhost:4002/user/products/${prod.id}`, prod)
    debugger
    if(p.data.massage=="product not found")
    p = await axios.post(`http://localhost:4002/user/products/${prod.id}`, prod)
    return p.data
}