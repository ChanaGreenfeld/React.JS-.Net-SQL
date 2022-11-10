import { addCategory } from '../Redux/Category/categoryServ';

export const InsertCategory=()=>{


    const insC=async (e)=>{
        e.preventDefault();
        debugger
        let c={
            id: 0,
            nameCategory:e.target[0].value
        }
      await  addCategory(c)
      alert("הקטגוריה נוספה בהצלחה")
    }


    return<>
    <form onSubmit = {async(e) =>  insC(e)}>
           <input type = "text" placeholder = "שם קטגוריה" required></input>
           <input type = "submit" value = "הוסף"/>
    </form>
   
       </>


}