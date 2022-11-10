import { Link } from "react-router-dom"
import { BrowserRouter, Route, Redirect, Switch } from 'react-router-dom';
import { DelP } from './delP';
import { InsertP } from './insertP';
export const UpdateProduct=()=>{

    return<>
    <BrowserRouter>
    <Link to="/insertP">הוספת מוצר</Link>  <hr/>
         <Link to="/delP">מחיקת מוצר</Link>  <hr/>
         
          <Switch>
            <Route path="/delP" component={DelP} exact></Route>
            <Route path="/insertP" component={InsertP} exact></Route> 
          </Switch>
    </BrowserRouter> 

    </>
}