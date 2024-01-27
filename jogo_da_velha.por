/*Criado por Danilo Ribeiro*/
/*Jogo da Velha*/

programa {
  funcao inicio() {
    caracter tabuleiro[3][3]
    inteiro jogador = 1, linha, coluna, numeroJogadas = 0, vencedor = 0, 

      /*Parâmetros iniciais do jogo*/
	    /*A variável jogador será alterada no decorrer do jogo. Será alternada entre 1 e 2 para cada jogada.*/
	    /*As variáveis (linha) e (coluna) alimentarão nossa matrix [3] por [3].*/
	    /*A variável (numeroJogadas) terá valor máximo igual a 9. Corresponde ao total de jogadas do Jogo da Velha.*/

    escreva("Bem-vindo! Este é um jogo da velha. Você deve jogar com outra pessoa! \n")
    escreva("Digite a posição da sua jogada na seguinte forma: (linha x, coluna y). Ou seja, por exemplo: (1,2) \n\n")
    escreva("Antes de começarmos, veja as posições para jogadas: \n")
    escreva("[0,0]\t[0,1]\t[0,2]\n")
    escreva("[1,0]\t[1,1]\t[1,2]\n")
    escreva("[2,0]\t[2,1]\t[2,2]\n\n")
    escreva("A primeiro pessoa que jogar será (X) e a segunda pessoa a jogar será (O). \n")
    escreva("Ganha quem fizer linha, coluna ou diagonal. Bom jogo!\n\n")

    /*Aqui tornamos os espaços em branco, onde no futuro, poderam ser substituídos por X ou O.*/

    para(inteiro i = 0; i < 3; i++){
      para(inteiro j = 0; j < 3; j++){
        tabuleiro[i][j] = ' '
      }
    }

    escreva("####################################################### \n")
    escreva("ESTE É O NOSSO TABULEIRO. POR FAVOR, iNÍCIE SUA JOGADA! \n")
    escreva("####################################################### \n")

    /* Aqui criamos de fato o tabuleiro.*/

    para(inteiro i = 0; i < 3; i++){
      para(inteiro j = 0; j < 3; j++){
        escreva("[", tabuleiro[i][j], "]")
      }
      escreva("\n")
    }

    /*Aqui dou início a lógica, de como o jogo funcionará*/

    enquanto((vencedor == 0)e(numeroJogadas < 9)){
        se(jogador == 1){
            escreva("\nVocê é o jogador ", jogador, ". Por favor, escolha sua jogada:\n")
            escreva("\nDigite uma linha: ")
            leia(linha)
            escreva("\nDigite uma coluna: ")
            leia(coluna)
            se((linha < 3)e(coluna < 3)e(tabuleiro[linha][coluna] == ' ')){
                escreva("Você digitou: (",linha,",",coluna,").\n")
                tabuleiro[linha][coluna] = 'X'
                escreva("A posição (",linha,",",coluna, "). Será prenchido com (X).\n\n")
                jogador = 2

                /*Agora, mostraremos a tabela atualizada para o usúario.*/

                para(inteiro i = 0; i < 3; i++){
                  para(inteiro j = 0; j < 3; j++){
                  escreva("[",tabuleiro[i][j],"]")
                  }
                  escreva("\n")
              } 
          }
          senao{
		          escreva("#################################\n")
		          escreva("Você digitou: uma opção inválida!\n")
		          escreva("#################################\n")
		          para(inteiro i = 0; i < 3; i++){
		            para(inteiro j = 0; j < 3; j++){
		              escreva("[",tabuleiro[i][j],"]")
		            }
		            escreva("\n")
		        }
		      }
        }

        /* Agora, repetimos o código para o jogador 2*/

        senao se(jogador == 2){
            escreva("Você é o jogador ", jogador, ". Por favor, escolha sua jogada:\n")
            escreva("\nDigite uma linha: ")
            leia(linha)
            escreva("\nDigite uma coluna: ")
            leia(coluna)
            se((linha < 3)e(coluna < 3)e(tabuleiro[linha][coluna] == ' ')){
                escreva("Você digitou: (",linha,",",coluna,")\n")
                tabuleiro[linha][coluna] = 'O'
                escreva("A posição (", linha, ",", coluna,"). Será preenchido com (O)\n")
                jogador = 1

                para(inteiro i = 0; i < 3; i++){
                    para(inteiro j = 0; j < 3; j++){
                        escreva("[",tabuleiro[i][j],"]")
                    }
                    escreva("\n")
                }
            }
            senao{
                escreva("#################################\n")
		            escreva("Você digitou: uma opção inválida!\n")
		            escreva("#################################\n")
                para(inteiro i = 0; i < 3; i++){
                    para(inteiro j = 0; j < 3; j++){
                        escreva("[",tabuleiro[i][j],"]")
                  }
                  escreva("\n")
                }
            }
        }

        escreva("\n\n")

      /*Aqui, vamos validar o vencedor*/
        se(vencedor == 0){
        /*Teste para as linhas vencedoras*/
        para(inteiro i = 0; i < 3; i++){
            se((tabuleiro[i][0] == 'X')e(tabuleiro[i][1] == 'X')e(tabuleiro[i][2] == 'X')){
                vencedor = 1
            }
            senao se((tabuleiro[i][0] == 'O')e(tabuleiro[i][1] == 'O')e(tabuleiro[i][2] == 'O')){
                vencedor = 2
            }        
        }
        /*Teste para as colunas vencedoras*/
        para(inteiro i = 0; i < 3; i++){
            se((tabuleiro[0][i] == 'X')e(tabuleiro[1][i] == 'X')e(tabuleiro[2][i] == 'X')){
                  vencedor = 1
            }
            senao se((tabuleiro[0][i] == 'O')e(tabuleiro[1][i] == 'O')e(tabuleiro[2][i] == 'O')){
                vencedor = 2
            }
        }
        /*Teste para as diagonais 1 e 2.*/
          se((tabuleiro[0][0] == 'X')e(tabuleiro[1][1] == 'X')e(tabuleiro[2][2] == 'X')){
              vencedor = 1
        }
            senao se((tabuleiro[0][0] == 'O')e(tabuleiro[1][1] == 'O')e(tabuleiro[2][2] == 'O')){
            vencedor = 2
            }

          se((tabuleiro[2][0] == 'X')e(tabuleiro[1][1] == 'X')e(tabuleiro[0][2] == 'X')){
              vencedor = 1
        }
            senao se((tabuleiro[2][0] == 'O')e(tabuleiro[1][1] == 'O')e(tabuleiro[0][2] == 'O')){
            vencedor = 2
            }

            numeroJogadas = numeroJogadas + 1
            /*escreva("jogada: ", numeroJogadas, "\n")*/
    }
  }
    /*Testar para verificar quem venceu*/
    se(vencedor == 1){
        escreva("\nParabéns! O jogador que escolheu (X) venceu!\n")
      }
      senao se(vencedor == 2){
          escreva("\nParabéns! O jogador que escolheu (O) venceu!\n")
    }
    senao{
        escreva("\nDeu VELHA! Jogue novamente!")
    }   
  }
}