/// Função para localizar o índice de um valor em um array
/// @param arr O array onde buscar
/// @param value O valor a ser encontrado
/// @return O índice do valor ou -1 se não encontrado
function array_index(arr, value) {
    for (var i = 0; i < array_length(arr); i++) {
        if (arr[i] == value) {
            return i; // Retorna o índice se encontrar
        }
    }
    return -1; // Retorna -1 se não encontrado
}
