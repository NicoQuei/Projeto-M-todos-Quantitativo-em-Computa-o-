# 📊 Análise Descritiva de Crimes Violentos Letais Intencionais (CVLI) - Ceará (2009–2024)

Este projeto realiza uma **análise descritiva** dos dados de Crimes Violentos Letais Intencionais (CVLI) no Ceará, entre os anos de **2009 e 2024**, utilizando **R** e os pacotes `tidyverse` e `janitor`.

---

## 🚀 Funcionalidades

O script realiza:

- **Limpeza e padronização** dos dados (`janitor::clean_names`).
- **Tabelas de frequências** simples e relativas para:
  - Natureza
  - Meio empregado
  - Gênero
  - Escolaridade da vítima
  - Raça da vítima
  - Dia da semana
- **Tabelas cruzadas** com frequências absolutas e relativas:
  - Meio empregado × Gênero
  - Escolaridade × Raça
- **Visualizações gráficas**:
  - Gráficos de setor (gênero, meio empregado)
  - Gráficos de barra (dia da semana, escolaridade)
  - Gráficos de linha (mês, ano, hora)
- **Medidas estatísticas**:
  - Posição (média, mediana, moda, quartis)
  - Dispersão (amplitude, variância, desvio padrão, IQR)
- **Boxplot** da idade das vítimas.

---

## 📦 Dependências

Antes de rodar, instale os pacotes necessários:

```r
install.packages(c("tidyverse", "janitor"))
