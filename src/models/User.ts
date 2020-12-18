import PasswordException from '../exception/PasswordException';
import EmailException from '../exception/EmailException';
import MySQL from '../db/MySQL';


export default class User {

    public idUser: number | null;
    public email: string;
    public pass: string= '';
    public nom: string;
    public prenom: string;
    public statut: boolean;
    

    protected table: string = 'user';


    constructor(user: User | null, idUser: number | null, email: string = '', pass: string | any = '', nom: string = '', prenom: string = '', statut: boolean) {

if (EmailException.checkEmail(email)) // Check valid syntaxe email
            throw new EmailException()
        if (!PasswordException.isValidPassword(pass)) // Check valid syntaxe password
            throw new PasswordException();
       

        if (user === null) {

            
            this.idUser = idUser;
            this.email = email;
            this.pass = pass;
            this.statut = statut;
            this.nom = nom.toUpperCase().trim();
            this.prenom = prenom.toLowerCase().trim();

        } 
        else {

            this.idUser = user.idUser;
            this.nom = user.nom;
            this.email = user.email;
            this.prenom = user.prenom;
            this.statut = user.statut;
            
        }
    }

    public get idUsers() : number {
        return <number> this.idUser;
    }
    get attribut(): Array < string> {
        return['id','email','pass', 'nom', 'prenom', 'statut'];
    }

    save(): Promise < number > {
        return new Promise((resolve, reject) => {
            MySQL.insert(this.table, this).then((id: number) => {
                this.idUser = id;
                console.log(`Save ${this.table}`);
                resolve(id)
            }).catch((err) => {
                console.log(err);
                reject(false)
            })
        })
    };
} 