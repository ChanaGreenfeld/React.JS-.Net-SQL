 import axios from "axios"
import {GetCategoryByName} from '../Category/categoryServ'

 export const GetAllPrudocts = async() => {
     let p
     p = await axios.get("http://localhost:4002/products")
     return p.data 
 }

 export const GetPrudoctsByCategory = async(name) => {
    let codeP;
    codeP=await GetCategoryByName(name)
    debugger
    let code=codeP[0].id
    let p
    p = await axios.get(`http://localhost:4002/ProductsByCategory/${code}`)
    return p.data 
}

export const GetPrudoctsById = async(id) => {
    let p
    p = await axios.get(`http://localhost:4002/Products/${id}`)
    return p.data 
}

export const updateAmount = async(oneP) => {
    debugger
    let p
    p = await axios.put("http://localhost:4002/Products",oneP)
    debugger
    return p.data 
}

export const removeP = async(id) => {
    debugger
    let p
    p = await axios.delete(`http://localhost:4002/Products/${id}`)
    debugger
    return p.data 
}

export const addP = async(prod) => {
    debugger
    let p
    p = await axios.post("http://localhost:4002/Products",prod)
    debugger
    return p.data 
}