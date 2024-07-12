#计算累加和程序

.text
main:
  lw  a1,0(x0)      # R[a1]:n,R[a1]<- Mem[0]，读取参数n
  beq a1,x0,fail    # if n=0 goto fail
  ori a2,x0,1        # R[a2]:i,=1 
  xor a3,a3,a3      # R[a3]:S,=0
 loop:
   add a3, a3, a2       # R[a3]=R[a3]+R[a2]
    beq a2, a1, finish  # if R[a2]>=n goto finish
    addi a2, a2, 1       # R[a2]=R[a2]+1
    jal x0, loop        #
  
 finish:
    sw a3, 4(x0)         # Store S to Mem[4],Mem[4]<-R[a3]

 pass:
  lui	a0,0xc10
  addi	a0,a0,-18  # R[a0]=0x00c0ffee
  ecall                  # 结束执行

 fail:
  lui	a0,0xdeade
  addi	a0,a0,-339  # R[a0]=0xdeaddead
  ecall                 # 结束执行

