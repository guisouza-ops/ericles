import React, { useState } from 'react';
import { View , Text, TextInput, StyleSheet, Button } from 'react-native';

export default function App() {

  const [login, setLogin] = useState('');
  const [senha, setSenha] = useState('');
  const [mensagem, setMensagem] = useState('');
  const [tela, setTela] = useState('');
  
  const [alunos, setAlunos] = useState([]);
  const[nome, setNome] = useState('');
  const[idade, setIdade] = useState('');
  const[curso, setCurso] = useState('');

  function validarLogin() {
    setMensagem('');
    if (login === 'admin' && senha === '123') {

      setTela('mudar');
    } else {
      setMensagem('Login ou senha incorretos!');
    }
  }

  function voltarTela(){
    setTela('');
    setLogin('');
    setSenha('');
    setMensagem('')
  }

  function cadastrarAluno() {
  const novoAluno = {
    nome,
    idade,
    curso
  };

setAlunos([...alunos, novoAluno]);

setNome('');
setIdade('');
setCurso('');
}

  if (tela === 'mudar') {
    return(
    <View style={styles.container}>
    <Text style={styles.titulo}>Cadastro de alunos</Text>
    <Text>Nome do aluno:</Text>
    <TextInput style={styles.input} onChangeText={setNome} placeholder='Digite o nome do aluno' value={nome}/>
    <Text>Idade do aluno:</Text>
    <TextInput style={styles.input} onChangeText={setIdade} placeholder='Digite a idade do aluno' value={idade} keyboardType="numeric"/>
    <Text>curso do aluno:</Text>
    <TextInput style={styles.input} onChangeText={setCurso} placeholder='Digite o curso do aluno' value={curso}/>
    <Button title="Cadastrar aluno" style={styles.botao} onPress={cadastrarAluno} />
    <br/>
    {alunos.map((aluno, index) => (
      <View key={index}>
        <Text>Nome: {aluno.nome}</Text>
        <Text>Idade: {aluno.idade}</Text>
        <Text>Curso: {aluno.curso}</Text>
        <Text>----------</Text>
      </View>
    )
    )}

    <Button title="Voltar" style={styles.botao} onPress={voltarTela} />
    </View>
  );

  }



  return (
    <View style={styles.container}>
      <Text style={styles.titulo}>Tela de Login</Text>

      <Text>Login:</Text>
      <TextInput style={styles.input} placeholder="Digite seu nome" onChangeText={setLogin}/>

      <Text>Senha:</Text>
      <TextInput style={styles.input} placeholder="Digite sua senha" onChangeText={setSenha}/>

      <Button title="Entrar" style={styles.botao} onPress={validarLogin} />

      <Text>{mensagem}</Text>

    </View>
  );

}

const styles = StyleSheet.create({
  container: {
    alignItems: "center",
    backgroundColor: "#383838",
    flex: 1,
    justifyContent: "center",
  },

  titulo:{
    fontSize: 25,
    color: "#FFFFFF",
  },

  input: {
    textAlign: "center",
    borderWidth: 1,
    borderRadius: 8,
    color: "#000000",
    backgroundColor: "#FFFFFF",
    marginBottom: 8,
    padding:5,
  },

  botao: {
    margin: 10,
    padding: 10,
  }

});
