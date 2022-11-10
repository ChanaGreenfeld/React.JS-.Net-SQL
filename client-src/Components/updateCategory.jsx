import { Link } from "react-router-dom"
import { BrowserRouter, Route, Redirect, Switch } from 'react-router-dom';
import { DelP } from './delP';
import { InsertCategory } from './insertCategory';
import { UpCategory } from './upCategory';

export const UpdateCategory=()=>{

    return<>
    <BrowserRouter>
         <Link to="/insertC">הוספת קטגוריה</Link>  <hr/>
         <Link to="/upCategory">עדכון קטגוריה</Link>  <hr/>
          <Switch>
            <Route path="/upCategory" component={UpCategory} exact></Route>
            <Route path="/insertC" component={InsertCategory} exact></Route> 
          </Switch>
    </BrowserRouter> 

    </>
}