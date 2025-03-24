Introdução
---

Relatório Técnico de Avaliação de Software/Hardware

1. Informações Gerais do Projeto
- Nome do Projeto: Bogalho’s Light
- Tipo de Projeto: Software - Jogo Metroidvania
- Data de Início:  30/6/2024
- Data de Término:  Em andamento
- Equipe de Desenvolvimento: Aléxis Martins dos Santos
- Responsável pelo Relatório: Aléxis Martins dos Santos
- Data do Relatório: 20/12/2024

---

2. Resumo Executivo
- Objetivo do Projeto: Desenvolver um metroidvania com elementos de exploração, combate e progressão em cenários interativos, e um modo online Jogador Vs Jogador com o uso da plataforma GX.Games
  
- Resumo das Funcionalidades: 
Jogabilidade focada em exploração e combate.
Sistema de estados para inimigos e comportamento adaptativo.
Persistência de dados utilizando JSON.
Transições dinâmicas entre salas (rooms).
Modo multijogador online JVJ, integrando suporte ao GX.Games para conectividade.

---

3. Metodologia de Desenvolvimento
- Modelo de Desenvolvimento Utilizado: Ágil, com ciclos iterativos de implementação e teste.
  
- Ferramentas e Tecnologias Utilizadas: 
GameMaker Studio 2: Ambiente principal de desenvolvimento.
GX.Games: Ferramenta para integração do modo multiplayer online.
JSON: Guardar as coordenadas e sala do jogador, para manter o progresso.
GitHub: Controle de versão detalhado e comentários descritivos para patches.
Milanote: Organização inicial do planeamento e funcionalidades.

- Cronograma e Fases de Desenvolvimento: 
Foco atual no desenvolvimento de lógica single-player.
Início do desenvolvimento do multijogador online

---

4. Avaliação dos Critérios de Qualidade

4.1. Funcionalidade
- Descrição: O sistema é projetado para atender a um metroidvania single-player com lógica robusta de estados e progressão, também possuindo um modo multijogador.

- Avaliação:  
  Percentual de conformidade: 65%  
  (0% a 100% - Insuficiente, Suficiente, Bom, Muito Bom)

- Justificativa: O jogo cumpre grande parte de suas funcionalidades básicas. A lógica para inimigos e transições entre salas funciona bem; o multijogador ainda está num estado inicial, porém já funcional.





---

4.2. Segurança
- Descrição: Medidas de segurança como validação de entrada e proteção contra manipulação de dados JSON ainda não foram implementadas. Para o multiplayer, a plataforma GX.Games trata da parte da segurança da conectividade dos jogadores.

- Testes de Segurança Realizados: Ainda por realizar.

- Avaliação: Percentual de conformidade: 20%  
  (0% a 100% - Insuficiente, Suficiente, Bom, Muito Bom)

- Justificativa: Segurança básica para single-player é suficiente; A segurança do multijogador é manuseada pelo GX.Games.
---

4.3. Desempenho
- Descrição: Avaliado em termos de resposta do jogador, taxa de quadros (FPS) e comportamento adaptativo de inimigos.

- Testes de Desempenho Realizados: 
Simulações com diversos inimigos na tela.
Verificação de quedas de FPS.

- Avaliação: Percentual de conformidade: 75%  
  (0% a 100% - Insuficiente, Suficiente, Bom, Muito Bom)

- Justificativa: O desempenho geral é bom, mas há quedas de FPS em situações de alta carga. A otimização do código para lógica de estados pode melhorar essa situação.

---

4.4. Integração
- Descrição: Integração com GX.Games para o multijogador. No momento, utiliza JSON para persistência de dados e ferramentas internas do GameMaker.

- Avaliação: Percentual de conformidade: 60%  
  (0% a 100% - Insuficiente, Suficiente, Bom, Muito Bom)

- Justificativa: A integração básica funciona bem para single-player. O uso da plataforma GX.Games é funcional por si só; as funções a implementar são todas parte da programação do gamemaker, e não funcionalidades do GX.Games.

---

4.5. Documentação
- Descrição: Documentação técnica e de desenvolvimento inclui:

Comentários no código.
Histórico de progresso no GitHub.
Planeamento inicial no Milanote.

- Avaliação: Percentual de conformidade: 70%  
  (0% a 100% - Insuficiente, Suficiente, Bom, Muito Bom)

- Justificativa: Embora haja boa organização no GitHub e Milanote, faltam manuais e documentação detalhada para futuras expansões.

---

5. Testes Realizados
- Tipos de Testes:

Listagem dos tipos de testes aplicados:
  - Testes Unitários
  - Testes de Integração
  - Testes Funcionais
  - Testes de Estresse
  - Testes de Segurança

- Resultados dos Testes:  
  Apresentar os resultados em uma tabela, demonstrando os critérios de aceitação e os valores alcançados.

Teste Unitário: Teste de funções e lógica em GML
Resultado: Passou com correções 
Conformidade: 80%

Teste Funcional: Avaliação de combate e transições de sala
Resultado: Parcialmente funcional
Conformidade: 85%

Teste de Segurança: Por realizar
Resultado: Por realizar
Conformidade: 10%

Teste de desempenho: Simulação com carga alta
Resultado: FPS instável
Conformidade: 70%

---

6. Conclusão e Recomendações
- Conclusão Geral: O jogo Bogalho’s Light está bem encaminhado, especialmente em sua lógica single-player e uso de estados. Apesar de ainda apresentar sinais “brutos” de estar em desenvolvimento, consegue demonstrar um progresso considerável, tendo muito horizonte por onde se expandir.

- Principais Pontos Fortes: 
Lógica de comportamento robusta e bem documentada.
Persistência de dados eficiente com JSON.
Conectividade multiplayer funcional.
Base sólida para expansão futura.

- Principais Pontos de Melhoria: 
Melhorar a documentação do projeto.
Expandir as funcionalidades multijogador e conteúdo do single-player.

- Recomendações: 
Documentar o progresso.
Focar na finalização dos pontos fortes do projeto.

---

7. Cronograma Detalhado de Realização do Projeto

7.1. Fases do Projeto
Descrever cada fase do projeto, com datas de início, término e duração:

Fase 1: Investigação e Levantamento de Requisitos
Início: 30/6/2024
Término: 10/7/2024

Fase 2: Planeamento do Single/Multiplayer e Design
Início: 11/7/2024
Término: 20/7/2024

Fase 3: Desenvolvimento (Single-Player)
Início: 21/7/2024
Término: Em andamento

Fase 4: Desenvolvimento do Multiplayer
Início: 15/12/2024
Término: Em andamento

Fase 5: Testes e Otimização
Início: 21/7/2024
Término: Em andamento

Fase 6: Implementação e Entrega
Início: Pendente
Término: Pendente

7.2. Marcos Importantes 

Conclusão da fase de requisitos: 10/7/2024

Aprovação do Design: 20/7/2024
Estrutura lógica e gráfica.

Primeira Versão “Beta”: 28/3/2024
Versão funcional single-player
Multiplayer Implementado
Integração com o GX.Games


8. Anexos
- Código-Fonte:  
  https://github.com/Sol3904/bogalhoport
https://github.com/Sol3904/bogalho-s-light
  
- Manuais e Documentação Técnica:  
  Anotações iniciais no milanote e descrições de patches no github.

- Resultados de Testes:  
 Incluídos acima.

---

Assinaturas

Responsável pelo Desenvolvimento: ____________________________________  
Data: _______________  
Responsável pela Avaliação: ____________________________________  
Data: _______________

---

