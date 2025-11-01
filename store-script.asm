addiu $t0, $zero, 0
addiu $t1, $zero, 0
addiu $t2, $zero, 5
addiu $t5, $zero, 10

store_loop:
    beq $t1, $t5, end_store_loop  # Se i == 10, sai do loop de escrita

    # Calcula o endereço do elemento atual: data_array[i]
    sll $t4, $t1, 2          # Calcula o deslocamento em bytes: offset = i * 2^2 (i * 4)
    add $t3, $t0, $t4        # Endereço final = endereço base + offset
    
    # Armazena o valor na memória
    sw $t2, 0($t3)           # Memory[endereço] = valor em $t2

    # Prepara para a próxima iteração
    addiu $t2, $t2, 1        # Incrementa o valor a ser escrito (5 -> 6, 6 -> 7, ...)
    addiu $t1, $t1, 1        # Incrementa o contador do loop: i++
    
    j store_loop             # Salta de volta para o início do loop
end_store_loop:
