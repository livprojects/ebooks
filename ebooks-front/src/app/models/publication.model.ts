export class Publication {

    id: number;
    // Remplacer par type User 
    user: string;
    title: string;
    content: string;


    constructor(id: number, user: string, title: string, content: string) {
        this.id = id;
        this.user = user;
        this.title = title;
        this.content = content;
    }
}
