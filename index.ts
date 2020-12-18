import PasswordException from "./src/exception/PasswordException";
import User from "./src/models/User";


// const pass =  PasswordException.hashPassword('yacine');

const Yacine = new User(null, null, 'Mike@gmail.com', 'yacine', 'Mike', 'Mike', true);


Yacine.save();
