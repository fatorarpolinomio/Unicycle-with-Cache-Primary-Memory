addiu $t0, $zero, 0
addiu $t1, $zero, 0
addiu $t2, $zero, 5
addiu $t5, $zero, 10


load_loop:
    beq $t1, $t5, end_program # Se i == 10, sai do loop de leitura

    # Calcula o endereço do elemento atual (mesma lógica de antes)
    sll $t4, $t1, 2          # offset = i * 4
    add $t3, $t0, $t4        # Endereço final = endereço base + offset
    
    # Carrega o valor da memória para o registrador $s0
    lw $s0, 0($t3)           # $s0 = Memory[endereço]
    
    # Prepara para a próxima iteração
    addiu $t1, $t1, 1        # Incrementa o contador do loop: i++
    
    j load_loop              # Salta de volta para o início do loop
end_program: