import { updateCategory } from '../Redux/Category/categoryServ';
import { useEffect } from "react"
import { useSelector, useDispatch } from "react-redux";
import {LoadData} from '../Redux/Category/categoryAction'
import { GetAllCategory, GetCategoryByName } from '../Redux/Category/categoryServ';

export const UpCategory=()=>{


    let myCategory
    var myDis = useDispatch()

    useEffect(async() => {
        debugger;
        myCategory = await GetAllCategory()
        myDis(LoadData(myCategory))
    }, [])

    let category = useSelector((store) => {
        debugger;
        return store.category.categoryFromServer
    })

 const   upC=async (e)=>{
    e.preventDefault();
    debugger
    let code = await GetCategoryByName(e.target[0].value)
    let cat={
        id: code[0].id,
        nameCategory:e.target[1].value
    }
   await updateCategory(cat)
   alert("הקטגוריה עודכנה בהצלחה")

    }
return<>
<form onSubmit = {async(e) =>  upC(e)}>

        <select>
                    {
                        category != undefined &&
                        category.length > 0 &&
                        category.map((item) =>
                            <>
                            <option>{item.nameCategory}</option> 
                            </>
                        )
                    }
        </select>
        <input type = "text" placeholder = "שם קטגוריה" required></input>
        <input type = "submit" value = "submit"/>
        </form>
</>
}