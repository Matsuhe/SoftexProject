import React from "react";
// import ReactDOM from "react-dom";
import Formulario  from './Formulario';
// import './estilo.css'
import Tabela from "./tabela";

class Principal extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            nome: '',
            idade: '',
            vetor: [] // Inicializando o estado do vetor vazio
        };
    }
    
    aoDigitar = (campo) => {
        this.setState({ [campo.target.name]: campo.target.value }, () => {
            //console.log(this.state);
        });
    }
    

    aoClicar = (botao) => {
        botao.preventDefault();
        
        if (this.state.nome && this.state.idade !== null) {
            var copiaVetor = [...this.state.vetor];
            copiaVetor.push({
                'nome': this.state.nome,
                'idade': this.state.idade
            });

            this.setState({ vetor: copiaVetor });
            this.setState({ nome: '', idade: '' });
        } else {
            alert("Por favor, preencha todos os campos antes de cadastrar.");
        }
    }
    

    render() {
        return (
            <div>
                <Formulario 
                            funcaoBotao={this.aoClicar} 
                            funcaoCampo={this.aoDigitar}
                            funcaoCampoNome={this.state.nome}
                            funcaoCampoIdade={this.state.idade}
                />
                {/* <Tabela/> */}
                <Tabela dados = {this.state.vetor} />

            </div>
        );
    }
}

// ReactDOM.render(<Principal/>, document.getElementById('root'));
export default Principal;
