# Backend teste Quero
<p>
    <img src="http://img.shields.io/static/v1?label=LICENSE&message=MIT&color=green"/>
    <img src="http://img.shields.io/static/v1?label=VERSION&message=1.0&color=blue"/>
    <img src="http://img.shields.io/static/v1?label=STATUS&message=REFACTORATION&color=orange"/>
</p>

Este projeto simula uma API de gerenciamento de cadastro de alunos, de matrículas e de faturas.
E foi dividido em backend e frontend.

## :computer: Para executar o projeto

 1) Instalar as dependências necessárias (dentro de backend/Bilinho e da pasta frontend)
 2) Dentro debackend/Bilinnho rodar: **`rails s`**
 3) Dentro da pasta frontend rodar: **`npm run serve`**

## :hammer: Funcionalidades do projeto

A API possui as seguinte ações:

* Listagem, criação, atualização e exclusão de Students;
* Listagem, criação, atualização e exclusão de Enrollments;
* Listagem de Bills.

## :exclamation: Restrições das entidades

Student:

 1) `Name` não pode estar vazio
 2) `CPF` dever conter exatamente 11 números, deve ser único e não pode estar vazio
 3) `Birthdate` pode estar vazio e deve ser uma data válida
 4) `Payment_method` não pode ser vazio e deve ser `Boleto ou Credit_card`

Enrollment:

 1) `Amount` não pode estar vazio, deve ser maior que 0 e deve ser igual a soma das faturas
 2) `Installments` não pode ser vazio e deve ser maior que 1
 3) `Due_day` não pode estar vazio, deve ser maior ou igual a 1 e menor ou igual a 31 

Bill:

 1) `Amount` não pode estar vazio, deve ser maior do que 0 
 2) `Due_date` não pode estar vazio e deve ser uma data válida
 3) `Status` não pode estar vazio e tem que ser `Open, pending ou paid` (default `Open`)


## :star: Tecnologias utilizadas

- **`Ruby on rails`** e **`Postgresql`** no backend
- **`Vue.js`** e **`CSS`** no frontend
- **`Cors`** e **`Axios`**
- **`Devise`** e **`Serializer`**