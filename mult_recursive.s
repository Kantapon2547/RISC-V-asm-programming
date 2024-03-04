.data
newline: .string "\n"

.text
main:
    # Load arguments
    li a0, 110
    li a1, 50

    # Call mult
    jal ra, mult

    # Print result
    li a0, 1       # Print integer
    mv a1, a0      # Move result to a1
    ecall          # System call for print integer

    # Print newline
    li a0, 4       # Print string
    la a1, newline # Load address of newline
    ecall          # System call for print string

    # Exit program
    li a0, 10      # Exit code 10
    ecall          # System call for exit

mult:
    # Save return address
    addi sp, sp, -4
    sw ra, 0(sp)

    # Check if b == 1
    beq a1, x0, mult_exit

    # Decrement b
    addi a1, a1, -1

    # Call mult recursively
    jal ra, mult

    # Multiply a and result of recursive call
    mul t0, a0, a1

    # Restore return address
    lw ra, 0(sp)
    addi sp, sp, 4

    # Return result
    ret

mult_exit:
    # Return a
    mv a0, a0
    ret
