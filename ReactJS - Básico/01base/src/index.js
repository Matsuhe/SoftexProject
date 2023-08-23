// Importar modulo
import React from 'react';
import  ReactDOM  from 'react-dom';

// ======================  Aula 1 ======================================
/*const estrutura = 
<div>
    <h1>Meu primeiro render</h1>
    <p>Testando como variável</p>
</div>
*/

//Render
/*ReactDOM.render(
    estrutura,
    document.getElementById('root')
    );
*/

// ======================  Aula 2 ======================================
// Sem JSX
/*const estrutura = React.createElement('h1',{},'Sem JSX')
ReactDOM.render(
    estrutura,
    document.getElementById('root')
    );
*/
// Com JSX
/*ReactDOM.render(
    <h1>Com JSX</h1>,
    document.getElementById('root')
    );
*/

// ======================  Aula 3 ======================================

//importar componentes
/*
import Componente01 from './Componente01';
import Componente02 from './Componente02';

// Componente
class Principal extends React.Component{
    render(){
        return(
                <div>
                    <Componente01/>
                    <Componente02/>
                </div>
            );
    }
}

//Render 
ReactDOM.render(
    <Principal/>,
    document.getElementById('root')
    );

// Exportar
export default Componente01;
*/

// ======================  Aula 4 ======================================

// Componente
/*
class Componente extends React.Component {
    render() {
        return (
            <div>
                <h1>Olá {this.props.info.nome2}</h1>
                <h1>Você tem {this.props.info.idade}</h1>
            </div>
        );
    }
}

// Json
var dados = { nome2: "Rafaela", idade: 31 };

// Render
ReactDOM.render(
    <Componente info={dados} />,
    document.getElementById('root')
);
*/

// ======================  Aula 5 ======================================
/*
// Componente
class Componente extends React.Component {
    // Construtor
    constructor(props) {
        super(props); 
        this.state = { nome: 'Ralf' }; 
    }

    render() {
        return (
            <h1>{this.state.nome}</h1>
        );
    }
}

// Render
ReactDOM.render(
    <Componente />,
    document.getElementById('root')
);
*/

// ======================  Aula 6 e 7 ======================================
/*
// Componente
class Componente extends React.Component {
    // Função
    mensagem(nome){
        alert('Olá '+ nome)
        console.log(this);
    }

    //Render
    render() {
        return (
            <button onClick={this.mensagem.bind(this, 'Ralf')}>Clique aqui</button>
        );
    }
}

// Render
ReactDOM.render(
    <Componente />,
    document.getElementById('root')
);
*/

// ======================  Aula 8 ======================================
/*
// Componente
class Componente extends React.Component {
    // Função
    mensagem(nome) {
        alert('Olá ' + nome);
        console.log(this);
    }

    minhaArrowFunction = (curso) => {
        alert('Funcionou a aprendizagem do ' + curso);
        console.log(this);
    }

    // Render
    render() {
        return (
            <div>
                <button onClick={this.mensagem.bind(this, 'Ralf')}>Clique aqui</button>
                <button onClick={() => this.minhaArrowFunction('ReactJS')}>ArrowFunction</button>
            </div>
        );
    }
}

// Render
ReactDOM.render(
    <Componente />,
    document.getElementById('root')
);
*/

// ======================  Aula 9 ======================================

/*
// Componente
class Componente extends React.Component {
    // Função
    mensagem(nome) {
        alert('Olá ' + nome);
        console.log(this);
    }

    minhaArrowFunction = (curso) => {
        alert('Funcionou a aprendizagem do ' + curso);
        console.log(this);
    }

    teclado = (obj) => {
        //alert('teste')
        console.log(obj.target.value);
    }

    // Render
    render() {
        return (
            <div>
                <button onClick={this.mensagem.bind(this, 'Ralf')}>Clique aqui</button>
                <button onClick={() => this.minhaArrowFunction('ReactJS')}>ArrowFunction</button>

                <hr/>

                <input type='text' onChange={this.teclado}/>

            </div>
        );
    }
}

// Render
ReactDOM.render(
    <Componente />,
    document.getElementById('root')
);

*/

// ======================  Aula 10 ======================================
/*
// Componente
class Componente extends React.Component {
    // Construtor
    constructor(props){
        super(props);
        this.state = {texto:this.props.textoinicial};
    }

    //funcao
    minhaFuncao = (elemento) =>{
        this.setState({texto: elemento.target.value})
    }


    // Render
    render() {
        return (
            <div>
                <h1>{this.state.texto}</h1>
                <input type='text'onChange={this.minhaFuncao} value={this.state.texto}/>
            </div>
        );
    }
}

// Render
ReactDOM.render(
    <Componente textoinicial='Digite algo ...'/>,
    document.getElementById('root')
);
*/

// ======================  Aula 11 ======================================
/*
// Componente
class Componente extends React.Component {
    // Construtor
    constructor(props){
        super(props);
        this.state = {exibir:false};
    }

    //funcao
    alterarState = (elemento) =>{
        let converter = !this.state.exibir;
        this.setState({exibir: converter})
    }

    // Render
    render() {
        let meuTexto= '';

        if(this.state.exibir){ //  utiliza === true 
            meuTexto= <h1>Parabéns por Concluir o Turtorial</h1>
        }else{
           // meuTexto = ''  //Nem precisa do else
        }

        return (
            <div>
                <h1>Condicional - If/Else</h1>
                <br/>
                {meuTexto}
                <br/>
                <button onClick={this.alterarState}>Clique aqui</button>
            </div>
        );
    }
}

// Render
ReactDOM.render(
    <Componente textoinicial='Digite algo ...'/>,
    document.getElementById('root')
);
*/

// ======================  Aula 11 ======================================
/*
// Componente
class Componente extends React.Component {

    // Render
    render() {
        
        let cores = ['Azul', 'Amarelo', 'Vermelho']

        //listar
        let listar =cores.map((cor,index) => {
            return <li key= {index}>{index} - {cor} </li>
            }
        );

        return(
            <ul>
                {listar}
            </ul>
        )
    }
}

ReactDOM.render(
    <Componente />,
    document.getElementById('root')
);
*/

// ======================  Aula 12 ======================================
/*
import './estilo.css'; 

// Componente
class Componente extends React.Component {

    // Render
    render() {
        const estilo = {
            color : 'blue',
            borderBottom: '5px solid black',
            backGround: 'darkblue' 
        }

        return(
            <div>
                <h1 style={{color:"red", background:"gray"}}>CSS INTERNO</h1>
                <h1 style={estilo}>CSS através de variaveis e constantes</h1>
                <h1 className='minhaClasse' >CSS Atraves de classes</h1>
            </div>
        )
    }
}

ReactDOM.render(
    <Componente />,
    document.getElementById('root')
);
*/
// ======================  Aula 12 ======================================
/*
// Componente
class Componente extends React.Component {
    //construtor
    constructor(props) {
        super(props);
        this.state = {cor:"vermelha"}
        
    }

    // depois de realizar o render 
    componentDidMount(){
        setTimeout(() => {
            this.setState({cor:"azul"});
        }, 2000);
    }

    // Render
    render() {
        return(
            <div>
                <h1>Minha cor preferida é {this.state.cor}</h1>
            </div>
        )
    }
}

ReactDOM.render(
    <Componente />,
    document.getElementById('root')
);
*/

// ======================  Aula 12.1 ======================================
/*
// Componente
class Componente extends React.Component {
    //construtor
    constructor(props) {
        super(props);
        this.state = {
            cor: "vermelha",
            contador: 0
        };
    }

    // depois de realizar o render
    componentDidMount() {
        this.startCounter();
    }

    // Inicia o contador
    startCounter() {
        this.counterInterval = setInterval(() => {
            if (this.state.contador === 5) {
                this.setState({ cor: "azul" });
            } else {
                this.setState(prevState => ({
                    contador: prevState.contador + 1
                }));
            }
        }, 1000);
    }

    // Render
    render() {
        return (
            <div>
                <h1>Minha cor preferida é {this.state.cor}</h1>
                {this.state.contador === 5 && <p>Contador chegou a 5!</p>}
                <p>Contador: {this.state.contador}</p>
            </div>
        );
    }

}

ReactDOM.render(
    <Componente />,
    document.getElementById('root')
);
*/

// ======================  Aula 13 ======================================
/*
// Componente
class Componente extends React.Component {
    // funcao 
    minhaFuncao = () =>{
        alert("Testando butao submit")
    }

    // Render
    render() {
        return (
            <form onSubmit={this.minhaFuncao}>
                <input type="submit" />
            </form>
        );
    }

}

ReactDOM.render(
    <Componente />,
    document.getElementById('root')
);
*/

// ======================  Aula 14 ======================================


// Componente
class Componente extends React.Component {
    //construtor
    constructor(props) {
        super(props);
        this.state = {
            nome : '',
            idade: null,

            Nome : '',
            Idade: null

        };
        
    }

    //funcao
    funcaoNome = (campo) => {
        this.setState({nome: campo.target.value});

    }

    //funcao
    funcaoIdade = (campo) => {
        this.setState({idade: campo.target.value});

    }

    //funcao
    enviarParaState = (campo) => {
        this.setState({[campo.target.name]: campo.target.value});

    }

    // Render
    render() {
        return (
            <form >
                <input type="text" placeholder='Nome' onChange={this.funcaoNome} />
                <input type="text" placeholder='Idade' onChange={this.funcaoIdade} />
                <br />
                <input type="text" placeholder='Nome' name='Nome' onChange={this.enviarParaState} />
                <input type="text" placeholder='Idade' name='Idade' onChange={this.enviarParaState} />
                <h1>{this.state.nome}</h1>
                <p>{this.state.idade}</p>
                <br />
                <h1>{this.state.Nome}</h1>
                <p>{this.state.Idade}</p>


            </form>
        );
    }

}

ReactDOM.render(
    <Componente />,
    document.getElementById('root')
);
