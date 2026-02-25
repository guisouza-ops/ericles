import React, { useState } from 'react';
import { Text, View, StyleSheet, TextInput, TouchableOpacity, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

export default function App() {
  const [text, setText] = useState('');

  // Função para salvar os dados
  const saveData = async () => {
    try {
      await AsyncStorage.setItem('@meu_dado', text);
      Alert.alert('Sucesso', 'Informações salvas com sucesso!');
    } catch (e) {
      Alert.alert('Erro', 'Falha ao salvar os dados.');
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.label}>LOGIN:</Text>
      
      <TextInput
        style={styles.input}
        placeholder="Email"
        onChangeText={setText}
        value={text}/>

<TextInput
        style={styles.input}
        placeholder="Senha"
        onChangeText={setText}
        value={text}/>


      <TouchableOpacity style={styles.button} onPress={saveData}>
        <Text style={styles.buttonText}>Entrar</Text>
      </TouchableOpacity>

      <View style={styles.footer}>
        <Text style={styles.footerText}>Back to the old house</Text>
      </View>

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20,
    backgroundColor: '#191970',
  },
  label: {
    fontSize: 18,
    marginBottom: 10,
    fontWeight: 'bold',
    color: '#ffff'
  },
  input: {
    backgroundColor: '#fff',
    padding: 15,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#ddd',
    marginBottom: 20,
  },
  button: {
    backgroundColor: '#007AFF',
    padding: 18,
    borderRadius: 10,
    alignItems: 'center',
    elevation: 3,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
  },
  buttonText: {
    color: '#fff',
    fontWeight: 'bold',
    fontSize: 16,
  },

  footer: {
    position: 'absolute',
    bottom: 0,
    width: '100%',
    backgroundColor: "rgba(10, 10, 10, 0.5)",
    paddingVertical: 15,
    alignItems: 'center'
  },
  footerText: {
    color: '#fff',
    fontSize: 14
  }
});
