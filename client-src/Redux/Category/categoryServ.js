import axios from "axios"

export const GetAllCategory = async() => {
    let category
    category = await axios.get("http://localhost:4002/caterories")
    return category.data
}

export const GetCategoryByName = async(name) => {
    let category
    category = await axios.get(`http://localhost:4002/caterories/${name}`)
    return category.data
}

export const addCategory = async(cate) => {
debugger
    let category
    category = await axios.post("http://localhost:4002/caterories",cate)
    debugger
    return category.data
}
export const updateCategory = async(cate) => {
    debugger
        let category
        category = await axios.put("http://localhost:4002/caterories",cate)
        debugger
        return category.data
    }


