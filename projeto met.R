install.packages(c("tidyverse", "janitor"))
library(tidyverse)
library(janitor)

dados = CVLI_2009_2024

dados = CVLI_2009_2024 %>%
  clean_names()


# ===============================================================
# Tabela com as frequências simples e relativas para as Variáveis
# ===============================================================


# Natureza    
freq_natureza = dados %>%
  count(natureza) %>%                # Frequência simples
  mutate(percent = n / sum(n) * 100) # Frequência relativa em %

freq_natureza

# Meio Empregado
freq_meio = dados %>%
  count(meio_empregado) %>%
  mutate(percent = n / sum(n) * 100)

# Gênero
freq_genero = dados %>%
  count(genero) %>%
  mutate(percent = n / sum(n) * 100)

# Escolaridade da Vítima
freq_escolaridade = dados %>%
  count(escolaridade_da_vitima) %>%
  mutate(percent = n / sum(n) * 100)

# Raça da Vítima
freq_raca = dados %>%
  count(raca_da_vitima) %>%
  mutate(percent = n / sum(n) * 100)

# Dia da Semana
freq_dia = dados %>%
  count(dia_da_semana) %>%
  mutate(percent = n / sum(n) * 100)


# ========================================================================
# Tabela cruzada com as frequências simples e relativas para as variáveis 
# ========================================================================


# Meio e genero
tabela_meio_genero = table(dados$meio_empregado, dados$genero) # Frequência simples

tabela_meio_genero_rel = round(prop.table(table(dados$meio_empregado, dados$genero)) * 100, 3) # Frequência relativa em %


# Escolaridade e raça
tabela_escolaridade_raca = table(dados$escolaridade_da_vitima, dados$raca_da_vitima) # Frequência simples

tabela_escolaridade_raca_rel = round(prop.table(tabela_escolaridade_raca) * 100, 3) # Frequência relativa (% em relação ao total)

tabela_escolaridade_raca_rel_linha = round(prop.table(tabela_escolaridade_raca, 1) * 100, 3) # Frequência relativa por linha (cada escolaridade somando 100%)


# ==================================
# Gráfico de setor para as variáveis
# ==================================


# Gênero
pie(freq_genero$percent,
    labels = paste(freq_genero$genero, "-", round(freq_genero$percent,3), "%"),
    main = "Distribuição de Gênero",
    col = c("green", "steelblue", "red"))


# Meio empregado
pie(freq_meio$percent,
    labels = paste(freq_meio$meio_empregado, "-", round(freq_meio$percent,3), "%"),
    main = "Meios usados",
    col = c("green", "steelblue", "yellow", "red"))


# ===================================
# Gráfico de barra para as variáveis
# ===================================


# Dia da semana
barplot(freq_dia$n,
        names.arg = freq_dia$dia_da_semana,
        main = "Distribuição por Dia da Semana",
        xlab = "Dia da Semana",
        col = "steelblue",
        las = 1)

# Escolaridade
barplot(freq_escolaridade$n,
        names.arg = freq_escolaridade$escolaridade_da_vitima,
        main = "Distribuição por Escolaridade da Vítima",
        col = "orange",
        las = 1,
        cex.names = 0.7)


# ===================================
# Gráfico por linha para as variáveis
# ===================================

# Frequências

# Mês
freq_mes = dados %>%
  count(mes = format(as.Date(data), "%m"))

# Ano
freq_ano = dados %>%
  count(ano = format(as.Date(data), "%Y"))

# Hora
CVLHORA=hour(dados$hora)


# Gráficos de linha


# Mês
plot(as.numeric(freq_mes$mes), freq_mes$n, type="o",
     xlab="Mês", ylab="Número de Ocorrências",
     main="Ocorrências por Mês",
     xaxt="n")
axis(1, at=1:12, labels=month.abb)

# Ano
plot(as.numeric(freq_ano$ano), freq_ano$n, type="o",
     xlab="Ano", ylab="Número de Ocorrências",
     main="Ocorrências por Ano")

# Hora
plot(as.numeric(names(tabela_hora)), as.numeric(tabela_hora),
     type="o", xlab="Hora do Dia", ylab="Número de Ocorrências",
     main="Ocorrências por Hora")



  # ===================================================
# Medidas de posição e separatrizes para as variáveis
# ===================================================


# Substitui Não Informada por NA e converte para número
dados$idade_da_vitima_num <- as.numeric(
  ifelse(dados$idade_da_vitima == "Não Informada", NA, dados$idade_da_vitima)
)

# Média
mean(dados$idade_da_vitima_num, na.rm = TRUE)

# Mediana
median(dados$idade_da_vitima_num, na.rm = TRUE)

# Moda
moda = function(x) {
  x <- x[!is.na(x)]  # remove NAs
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
moda(dados$idade_da_vitima_num)

# Quartis
quantile(dados$idade_da_vitima_num, probs = c(0.25, 0.5, 0.75), na.rm = TRUE)


# ===================================
# Medidas dispersão para as variáveis
# ===================================


# Amplitude
diff(range(dados$idade_da_vitima_num, na.rm = TRUE))

# Variância
var(dados$idade_da_vitima_num, na.rm = TRUE)

# Desvio padrão
sd(dados$idade_da_vitima_num, na.rm = TRUE)

# IQR
IQR(dados$idade_da_vitima_num, na.rm = TRUE)


# =========================
# Boxplot para as variáveis
# =========================

boxplot(dados$idade_da_vitima_num,
        main = "Boxplot da Idade da Vítima",
        ylab = "Idade (anos)",
        col = "lightblue",
        horizontal = FALSE,
        notch = TRUE)
  
