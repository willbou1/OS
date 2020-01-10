
mykernel.bin:     file format elf32-i386


Disassembly of section .text:

00100000 <clearScreen-0xc>:
  100000:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fb                   	sti    
  100009:	4f                   	dec    %edi
  10000a:	52                   	push   %edx
  10000b:	e4                   	.byte 0xe4

0010000c <clearScreen>:
  10000c:	55                   	push   %ebp
  10000d:	89 e5                	mov    %esp,%ebp
  10000f:	53                   	push   %ebx
  100010:	83 ec 14             	sub    $0x14,%esp
  100013:	e8 3c 03 00 00       	call   100354 <__x86.get_pc_thunk.bx>
  100018:	81 c3 4c 1b 00 00    	add    $0x1b4c,%ebx
  10001e:	c7 83 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
  100025:	00 00 00 
  100028:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
  10002e:	eb 1d                	jmp    10004d <clearScreen+0x41>
  100030:	83 ec 0c             	sub    $0xc,%esp
  100033:	8d 83 d6 f9 ff ff    	lea    -0x62a(%ebx),%eax
  100039:	50                   	push   %eax
  10003a:	e8 3f 00 00 00       	call   10007e <printf>
  10003f:	83 c4 10             	add    $0x10,%esp
  100042:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100046:	83 c0 01             	add    $0x1,%eax
  100049:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  10004d:	66 83 7d f6 4f       	cmpw   $0x4f,-0xa(%ebp)
  100052:	76 dc                	jbe    100030 <clearScreen+0x24>
  100054:	c7 83 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
  10005b:	00 00 00 
  10005e:	90                   	nop
  10005f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100062:	c9                   	leave  
  100063:	c3                   	ret    

00100064 <backUp>:
  100064:	55                   	push   %ebp
  100065:	89 e5                	mov    %esp,%ebp
  100067:	e8 e4 02 00 00       	call   100350 <__x86.get_pc_thunk.ax>
  10006c:	05 f8 1a 00 00       	add    $0x1af8,%eax
  100071:	c7 80 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
  100078:	00 00 00 
  10007b:	90                   	nop
  10007c:	5d                   	pop    %ebp
  10007d:	c3                   	ret    

0010007e <printf>:
  10007e:	55                   	push   %ebp
  10007f:	89 e5                	mov    %esp,%ebp
  100081:	53                   	push   %ebx
  100082:	83 ec 10             	sub    $0x10,%esp
  100085:	e8 c6 02 00 00       	call   100350 <__x86.get_pc_thunk.ax>
  10008a:	05 da 1a 00 00       	add    $0x1ada,%eax
  10008f:	c7 45 f4 00 80 0b 00 	movl   $0xb8000,-0xc(%ebp)
  100096:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  10009d:	eb 4c                	jmp    1000eb <printf+0x6d>
  10009f:	8b 90 1c 00 00 00    	mov    0x1c(%eax),%edx
  1000a5:	8d 0c 12             	lea    (%edx,%edx,1),%ecx
  1000a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1000ab:	01 ca                	add    %ecx,%edx
  1000ad:	0f b7 12             	movzwl (%edx),%edx
  1000b0:	89 d3                	mov    %edx,%ebx
  1000b2:	b3 00                	mov    $0x0,%bl
  1000b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1000b7:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1000ba:	01 ca                	add    %ecx,%edx
  1000bc:	0f b6 12             	movzbl (%edx),%edx
  1000bf:	66 0f be d2          	movsbw %dl,%dx
  1000c3:	09 d3                	or     %edx,%ebx
  1000c5:	89 d9                	mov    %ebx,%ecx
  1000c7:	8b 90 1c 00 00 00    	mov    0x1c(%eax),%edx
  1000cd:	8d 1c 12             	lea    (%edx,%edx,1),%ebx
  1000d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1000d3:	01 da                	add    %ebx,%edx
  1000d5:	66 89 0a             	mov    %cx,(%edx)
  1000d8:	8b 90 1c 00 00 00    	mov    0x1c(%eax),%edx
  1000de:	83 c2 01             	add    $0x1,%edx
  1000e1:	89 90 1c 00 00 00    	mov    %edx,0x1c(%eax)
  1000e7:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1000eb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1000ee:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1000f1:	01 ca                	add    %ecx,%edx
  1000f3:	0f b6 12             	movzbl (%edx),%edx
  1000f6:	84 d2                	test   %dl,%dl
  1000f8:	75 a5                	jne    10009f <printf+0x21>
  1000fa:	90                   	nop
  1000fb:	90                   	nop
  1000fc:	83 c4 10             	add    $0x10,%esp
  1000ff:	5b                   	pop    %ebx
  100100:	5d                   	pop    %ebp
  100101:	c3                   	ret    

00100102 <hexDump>:
  100102:	55                   	push   %ebp
  100103:	89 e5                	mov    %esp,%ebp
  100105:	53                   	push   %ebx
  100106:	83 ec 20             	sub    $0x20,%esp
  100109:	e8 46 02 00 00       	call   100354 <__x86.get_pc_thunk.bx>
  10010e:	81 c3 56 1a 00 00    	add    $0x1a56,%ebx
  100114:	c7 45 e8 30 31 32 33 	movl   $0x33323130,-0x18(%ebp)
  10011b:	c7 45 ec 34 35 36 37 	movl   $0x37363534,-0x14(%ebp)
  100122:	c7 45 f0 38 39 41 42 	movl   $0x42413938,-0x10(%ebp)
  100129:	c7 45 f4 43 44 45 46 	movl   $0x46454443,-0xc(%ebp)
  100130:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  100134:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  10013b:	eb 51                	jmp    10018e <hexDump+0x8c>
  10013d:	8b 55 08             	mov    0x8(%ebp),%edx
  100140:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100143:	01 d0                	add    %edx,%eax
  100145:	0f b6 00             	movzbl (%eax),%eax
  100148:	c0 e8 04             	shr    $0x4,%al
  10014b:	0f b6 c0             	movzbl %al,%eax
  10014e:	0f b6 44 05 e8       	movzbl -0x18(%ebp,%eax,1),%eax
  100153:	88 45 e5             	mov    %al,-0x1b(%ebp)
  100156:	8b 55 08             	mov    0x8(%ebp),%edx
  100159:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10015c:	01 d0                	add    %edx,%eax
  10015e:	0f b6 00             	movzbl (%eax),%eax
  100161:	0f b6 c0             	movzbl %al,%eax
  100164:	83 e0 0f             	and    $0xf,%eax
  100167:	0f b6 44 05 e8       	movzbl -0x18(%ebp,%eax,1),%eax
  10016c:	88 45 e6             	mov    %al,-0x1a(%ebp)
  10016f:	8d 45 e5             	lea    -0x1b(%ebp),%eax
  100172:	50                   	push   %eax
  100173:	e8 06 ff ff ff       	call   10007e <printf>
  100178:	83 c4 04             	add    $0x4,%esp
  10017b:	8d 83 f0 f9 ff ff    	lea    -0x610(%ebx),%eax
  100181:	50                   	push   %eax
  100182:	e8 f7 fe ff ff       	call   10007e <printf>
  100187:	83 c4 04             	add    $0x4,%esp
  10018a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  10018e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100191:	3b 45 0c             	cmp    0xc(%ebp),%eax
  100194:	72 a7                	jb     10013d <hexDump+0x3b>
  100196:	90                   	nop
  100197:	90                   	nop
  100198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10019b:	c9                   	leave  
  10019c:	c3                   	ret    

0010019d <printRegisters>:
  10019d:	55                   	push   %ebp
  10019e:	89 e5                	mov    %esp,%ebp
  1001a0:	56                   	push   %esi
  1001a1:	53                   	push   %ebx
  1001a2:	83 ec 30             	sub    $0x30,%esp
  1001a5:	e8 aa 01 00 00       	call   100354 <__x86.get_pc_thunk.bx>
  1001aa:	81 c3 ba 19 00 00    	add    $0x19ba,%ebx
  1001b0:	89 c6                	mov    %eax,%esi
  1001b2:	89 d9                	mov    %ebx,%ecx
  1001b4:	89 ca                	mov    %ecx,%edx
  1001b6:	89 d0                	mov    %edx,%eax
  1001b8:	89 75 f4             	mov    %esi,-0xc(%ebp)
  1001bb:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  1001be:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1001c1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1001c4:	89 f6                	mov    %esi,%esi
  1001c6:	89 f9                	mov    %edi,%ecx
  1001c8:	89 ca                	mov    %ecx,%edx
  1001ca:	89 d0                	mov    %edx,%eax
  1001cc:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  1001cf:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  1001d2:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1001d5:	89 45 d8             	mov    %eax,-0x28(%ebp)
  1001d8:	8c ce                	mov    %cs,%esi
  1001da:	8c d9                	mov    %ds,%ecx
  1001dc:	8c d2                	mov    %ss,%edx
  1001de:	8c c0                	mov    %es,%eax
  1001e0:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1001e3:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  1001e6:	89 55 cc             	mov    %edx,-0x34(%ebp)
  1001e9:	89 45 c8             	mov    %eax,-0x38(%ebp)
  1001ec:	8d 83 f2 f9 ff ff    	lea    -0x60e(%ebx),%eax
  1001f2:	50                   	push   %eax
  1001f3:	e8 86 fe ff ff       	call   10007e <printf>
  1001f8:	83 c4 04             	add    $0x4,%esp
  1001fb:	6a 04                	push   $0x4
  1001fd:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100200:	50                   	push   %eax
  100201:	e8 fc fe ff ff       	call   100102 <hexDump>
  100206:	83 c4 08             	add    $0x8,%esp
  100209:	8d 83 fa f9 ff ff    	lea    -0x606(%ebx),%eax
  10020f:	50                   	push   %eax
  100210:	e8 69 fe ff ff       	call   10007e <printf>
  100215:	83 c4 04             	add    $0x4,%esp
  100218:	6a 04                	push   $0x4
  10021a:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10021d:	50                   	push   %eax
  10021e:	e8 df fe ff ff       	call   100102 <hexDump>
  100223:	83 c4 08             	add    $0x8,%esp
  100226:	8d 83 02 fa ff ff    	lea    -0x5fe(%ebx),%eax
  10022c:	50                   	push   %eax
  10022d:	e8 4c fe ff ff       	call   10007e <printf>
  100232:	83 c4 04             	add    $0x4,%esp
  100235:	6a 04                	push   $0x4
  100237:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10023a:	50                   	push   %eax
  10023b:	e8 c2 fe ff ff       	call   100102 <hexDump>
  100240:	83 c4 08             	add    $0x8,%esp
  100243:	8d 83 0a fa ff ff    	lea    -0x5f6(%ebx),%eax
  100249:	50                   	push   %eax
  10024a:	e8 2f fe ff ff       	call   10007e <printf>
  10024f:	83 c4 04             	add    $0x4,%esp
  100252:	6a 04                	push   $0x4
  100254:	8d 45 e8             	lea    -0x18(%ebp),%eax
  100257:	50                   	push   %eax
  100258:	e8 a5 fe ff ff       	call   100102 <hexDump>
  10025d:	83 c4 08             	add    $0x8,%esp
  100260:	8d 83 12 fa ff ff    	lea    -0x5ee(%ebx),%eax
  100266:	50                   	push   %eax
  100267:	e8 12 fe ff ff       	call   10007e <printf>
  10026c:	83 c4 04             	add    $0x4,%esp
  10026f:	6a 04                	push   $0x4
  100271:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100274:	50                   	push   %eax
  100275:	e8 88 fe ff ff       	call   100102 <hexDump>
  10027a:	83 c4 08             	add    $0x8,%esp
  10027d:	8d 83 1a fa ff ff    	lea    -0x5e6(%ebx),%eax
  100283:	50                   	push   %eax
  100284:	e8 f5 fd ff ff       	call   10007e <printf>
  100289:	83 c4 04             	add    $0x4,%esp
  10028c:	6a 04                	push   $0x4
  10028e:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100291:	50                   	push   %eax
  100292:	e8 6b fe ff ff       	call   100102 <hexDump>
  100297:	83 c4 08             	add    $0x8,%esp
  10029a:	8d 83 22 fa ff ff    	lea    -0x5de(%ebx),%eax
  1002a0:	50                   	push   %eax
  1002a1:	e8 d8 fd ff ff       	call   10007e <printf>
  1002a6:	83 c4 04             	add    $0x4,%esp
  1002a9:	6a 04                	push   $0x4
  1002ab:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1002ae:	50                   	push   %eax
  1002af:	e8 4e fe ff ff       	call   100102 <hexDump>
  1002b4:	83 c4 08             	add    $0x8,%esp
  1002b7:	8d 83 2a fa ff ff    	lea    -0x5d6(%ebx),%eax
  1002bd:	50                   	push   %eax
  1002be:	e8 bb fd ff ff       	call   10007e <printf>
  1002c3:	83 c4 04             	add    $0x4,%esp
  1002c6:	6a 04                	push   $0x4
  1002c8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1002cb:	50                   	push   %eax
  1002cc:	e8 31 fe ff ff       	call   100102 <hexDump>
  1002d1:	83 c4 08             	add    $0x8,%esp
  1002d4:	8d 83 32 fa ff ff    	lea    -0x5ce(%ebx),%eax
  1002da:	50                   	push   %eax
  1002db:	e8 9e fd ff ff       	call   10007e <printf>
  1002e0:	83 c4 04             	add    $0x4,%esp
  1002e3:	6a 04                	push   $0x4
  1002e5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1002e8:	50                   	push   %eax
  1002e9:	e8 14 fe ff ff       	call   100102 <hexDump>
  1002ee:	83 c4 08             	add    $0x8,%esp
  1002f1:	8d 83 39 fa ff ff    	lea    -0x5c7(%ebx),%eax
  1002f7:	50                   	push   %eax
  1002f8:	e8 81 fd ff ff       	call   10007e <printf>
  1002fd:	83 c4 04             	add    $0x4,%esp
  100300:	6a 04                	push   $0x4
  100302:	8d 45 d0             	lea    -0x30(%ebp),%eax
  100305:	50                   	push   %eax
  100306:	e8 f7 fd ff ff       	call   100102 <hexDump>
  10030b:	83 c4 08             	add    $0x8,%esp
  10030e:	8d 83 40 fa ff ff    	lea    -0x5c0(%ebx),%eax
  100314:	50                   	push   %eax
  100315:	e8 64 fd ff ff       	call   10007e <printf>
  10031a:	83 c4 04             	add    $0x4,%esp
  10031d:	6a 04                	push   $0x4
  10031f:	8d 45 cc             	lea    -0x34(%ebp),%eax
  100322:	50                   	push   %eax
  100323:	e8 da fd ff ff       	call   100102 <hexDump>
  100328:	83 c4 08             	add    $0x8,%esp
  10032b:	8d 83 47 fa ff ff    	lea    -0x5b9(%ebx),%eax
  100331:	50                   	push   %eax
  100332:	e8 47 fd ff ff       	call   10007e <printf>
  100337:	83 c4 04             	add    $0x4,%esp
  10033a:	6a 04                	push   $0x4
  10033c:	8d 45 c8             	lea    -0x38(%ebp),%eax
  10033f:	50                   	push   %eax
  100340:	e8 bd fd ff ff       	call   100102 <hexDump>
  100345:	83 c4 08             	add    $0x8,%esp
  100348:	90                   	nop
  100349:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10034c:	5b                   	pop    %ebx
  10034d:	5e                   	pop    %esi
  10034e:	5d                   	pop    %ebp
  10034f:	c3                   	ret    

00100350 <__x86.get_pc_thunk.ax>:
  100350:	8b 04 24             	mov    (%esp),%eax
  100353:	c3                   	ret    

00100354 <__x86.get_pc_thunk.bx>:
  100354:	8b 1c 24             	mov    (%esp),%ebx
  100357:	c3                   	ret    

00100358 <_exception0>:
  100358:	60                   	pusha  
  100359:	6a 00                	push   $0x0
  10035b:	e8 91 10 00 00       	call   1013f1 <handleException>
  100360:	83 c4 04             	add    $0x4,%esp
  100363:	61                   	popa   
  100364:	cf                   	iret   

00100365 <_exception1>:
  100365:	60                   	pusha  
  100366:	6a 01                	push   $0x1
  100368:	e8 84 10 00 00       	call   1013f1 <handleException>
  10036d:	83 c4 04             	add    $0x4,%esp
  100370:	61                   	popa   
  100371:	cf                   	iret   

00100372 <_exception2>:
  100372:	60                   	pusha  
  100373:	6a 02                	push   $0x2
  100375:	e8 77 10 00 00       	call   1013f1 <handleException>
  10037a:	83 c4 04             	add    $0x4,%esp
  10037d:	61                   	popa   
  10037e:	cf                   	iret   

0010037f <_exception3>:
  10037f:	60                   	pusha  
  100380:	6a 03                	push   $0x3
  100382:	e8 6a 10 00 00       	call   1013f1 <handleException>
  100387:	83 c4 04             	add    $0x4,%esp
  10038a:	61                   	popa   
  10038b:	cf                   	iret   

0010038c <_exception4>:
  10038c:	60                   	pusha  
  10038d:	6a 04                	push   $0x4
  10038f:	e8 5d 10 00 00       	call   1013f1 <handleException>
  100394:	83 c4 04             	add    $0x4,%esp
  100397:	61                   	popa   
  100398:	cf                   	iret   

00100399 <_exception5>:
  100399:	60                   	pusha  
  10039a:	6a 05                	push   $0x5
  10039c:	e8 50 10 00 00       	call   1013f1 <handleException>
  1003a1:	83 c4 04             	add    $0x4,%esp
  1003a4:	61                   	popa   
  1003a5:	cf                   	iret   

001003a6 <_exception6>:
  1003a6:	60                   	pusha  
  1003a7:	6a 06                	push   $0x6
  1003a9:	e8 43 10 00 00       	call   1013f1 <handleException>
  1003ae:	83 c4 04             	add    $0x4,%esp
  1003b1:	61                   	popa   
  1003b2:	cf                   	iret   

001003b3 <_exception7>:
  1003b3:	60                   	pusha  
  1003b4:	6a 07                	push   $0x7
  1003b6:	e8 36 10 00 00       	call   1013f1 <handleException>
  1003bb:	83 c4 04             	add    $0x4,%esp
  1003be:	61                   	popa   
  1003bf:	cf                   	iret   

001003c0 <_exception8>:
  1003c0:	60                   	pusha  
  1003c1:	6a 08                	push   $0x8
  1003c3:	e8 29 10 00 00       	call   1013f1 <handleException>
  1003c8:	83 c4 08             	add    $0x8,%esp
  1003cb:	61                   	popa   
  1003cc:	cf                   	iret   

001003cd <_exception9>:
  1003cd:	60                   	pusha  
  1003ce:	6a 09                	push   $0x9
  1003d0:	e8 1c 10 00 00       	call   1013f1 <handleException>
  1003d5:	83 c4 04             	add    $0x4,%esp
  1003d8:	61                   	popa   
  1003d9:	cf                   	iret   

001003da <_exception10>:
  1003da:	60                   	pusha  
  1003db:	6a 0a                	push   $0xa
  1003dd:	e8 0f 10 00 00       	call   1013f1 <handleException>
  1003e2:	83 c4 08             	add    $0x8,%esp
  1003e5:	61                   	popa   
  1003e6:	cf                   	iret   

001003e7 <_exception11>:
  1003e7:	60                   	pusha  
  1003e8:	6a 0b                	push   $0xb
  1003ea:	e8 02 10 00 00       	call   1013f1 <handleException>
  1003ef:	83 c4 04             	add    $0x4,%esp
  1003f2:	61                   	popa   
  1003f3:	cf                   	iret   

001003f4 <_exception12>:
  1003f4:	60                   	pusha  
  1003f5:	6a 0c                	push   $0xc
  1003f7:	e8 f5 0f 00 00       	call   1013f1 <handleException>
  1003fc:	83 c4 04             	add    $0x4,%esp
  1003ff:	61                   	popa   
  100400:	cf                   	iret   

00100401 <_exception13>:
  100401:	60                   	pusha  
  100402:	6a 0d                	push   $0xd
  100404:	e8 e8 0f 00 00       	call   1013f1 <handleException>
  100409:	83 c4 04             	add    $0x4,%esp
  10040c:	61                   	popa   
  10040d:	cf                   	iret   

0010040e <_exception14>:
  10040e:	60                   	pusha  
  10040f:	6a 0e                	push   $0xe
  100411:	e8 db 0f 00 00       	call   1013f1 <handleException>
  100416:	83 c4 08             	add    $0x8,%esp
  100419:	61                   	popa   
  10041a:	cf                   	iret   

0010041b <_exception15>:
  10041b:	60                   	pusha  
  10041c:	6a 0f                	push   $0xf
  10041e:	e8 ce 0f 00 00       	call   1013f1 <handleException>
  100423:	83 c4 04             	add    $0x4,%esp
  100426:	61                   	popa   
  100427:	cf                   	iret   

00100428 <_exception16>:
  100428:	60                   	pusha  
  100429:	6a 10                	push   $0x10
  10042b:	e8 c1 0f 00 00       	call   1013f1 <handleException>
  100430:	83 c4 04             	add    $0x4,%esp
  100433:	61                   	popa   
  100434:	cf                   	iret   

00100435 <_exception17>:
  100435:	60                   	pusha  
  100436:	6a 11                	push   $0x11
  100438:	e8 b4 0f 00 00       	call   1013f1 <handleException>
  10043d:	83 c4 04             	add    $0x4,%esp
  100440:	61                   	popa   
  100441:	cf                   	iret   

00100442 <_exception18>:
  100442:	60                   	pusha  
  100443:	6a 12                	push   $0x12
  100445:	e8 a7 0f 00 00       	call   1013f1 <handleException>
  10044a:	83 c4 04             	add    $0x4,%esp
  10044d:	61                   	popa   
  10044e:	cf                   	iret   

0010044f <_exception19>:
  10044f:	60                   	pusha  
  100450:	6a 13                	push   $0x13
  100452:	e8 9a 0f 00 00       	call   1013f1 <handleException>
  100457:	83 c4 04             	add    $0x4,%esp
  10045a:	61                   	popa   
  10045b:	cf                   	iret   

0010045c <_exception20>:
  10045c:	60                   	pusha  
  10045d:	6a 14                	push   $0x14
  10045f:	e8 8d 0f 00 00       	call   1013f1 <handleException>
  100464:	83 c4 04             	add    $0x4,%esp
  100467:	61                   	popa   
  100468:	cf                   	iret   

00100469 <_exception21>:
  100469:	60                   	pusha  
  10046a:	6a 15                	push   $0x15
  10046c:	e8 80 0f 00 00       	call   1013f1 <handleException>
  100471:	83 c4 04             	add    $0x4,%esp
  100474:	61                   	popa   
  100475:	cf                   	iret   

00100476 <_exception22>:
  100476:	60                   	pusha  
  100477:	6a 16                	push   $0x16
  100479:	e8 73 0f 00 00       	call   1013f1 <handleException>
  10047e:	83 c4 04             	add    $0x4,%esp
  100481:	61                   	popa   
  100482:	cf                   	iret   

00100483 <_exception23>:
  100483:	60                   	pusha  
  100484:	6a 17                	push   $0x17
  100486:	e8 66 0f 00 00       	call   1013f1 <handleException>
  10048b:	83 c4 04             	add    $0x4,%esp
  10048e:	61                   	popa   
  10048f:	cf                   	iret   

00100490 <_exception24>:
  100490:	60                   	pusha  
  100491:	6a 18                	push   $0x18
  100493:	e8 59 0f 00 00       	call   1013f1 <handleException>
  100498:	83 c4 04             	add    $0x4,%esp
  10049b:	61                   	popa   
  10049c:	cf                   	iret   

0010049d <_exception25>:
  10049d:	60                   	pusha  
  10049e:	6a 19                	push   $0x19
  1004a0:	e8 4c 0f 00 00       	call   1013f1 <handleException>
  1004a5:	83 c4 04             	add    $0x4,%esp
  1004a8:	61                   	popa   
  1004a9:	cf                   	iret   

001004aa <_exception26>:
  1004aa:	60                   	pusha  
  1004ab:	6a 1a                	push   $0x1a
  1004ad:	e8 3f 0f 00 00       	call   1013f1 <handleException>
  1004b2:	83 c4 04             	add    $0x4,%esp
  1004b5:	61                   	popa   
  1004b6:	cf                   	iret   

001004b7 <_exception27>:
  1004b7:	60                   	pusha  
  1004b8:	6a 1b                	push   $0x1b
  1004ba:	e8 32 0f 00 00       	call   1013f1 <handleException>
  1004bf:	83 c4 04             	add    $0x4,%esp
  1004c2:	61                   	popa   
  1004c3:	cf                   	iret   

001004c4 <_exception28>:
  1004c4:	60                   	pusha  
  1004c5:	6a 1c                	push   $0x1c
  1004c7:	e8 25 0f 00 00       	call   1013f1 <handleException>
  1004cc:	83 c4 04             	add    $0x4,%esp
  1004cf:	61                   	popa   
  1004d0:	cf                   	iret   

001004d1 <_exception29>:
  1004d1:	60                   	pusha  
  1004d2:	6a 1d                	push   $0x1d
  1004d4:	e8 18 0f 00 00       	call   1013f1 <handleException>
  1004d9:	83 c4 04             	add    $0x4,%esp
  1004dc:	61                   	popa   
  1004dd:	cf                   	iret   

001004de <_exception30>:
  1004de:	60                   	pusha  
  1004df:	6a 1e                	push   $0x1e
  1004e1:	e8 0b 0f 00 00       	call   1013f1 <handleException>
  1004e6:	83 c4 04             	add    $0x4,%esp
  1004e9:	61                   	popa   
  1004ea:	cf                   	iret   

001004eb <_exception31>:
  1004eb:	60                   	pusha  
  1004ec:	6a 1f                	push   $0x1f
  1004ee:	e8 fe 0e 00 00       	call   1013f1 <handleException>
  1004f3:	83 c4 04             	add    $0x4,%esp
  1004f6:	61                   	popa   
  1004f7:	cf                   	iret   

001004f8 <_unused>:
  1004f8:	cf                   	iret   

001004f9 <_irq32>:
  1004f9:	60                   	pusha  
  1004fa:	6a 20                	push   $0x20
  1004fc:	e8 7e 0e 00 00       	call   10137f <handleIRQ>
  100501:	83 c4 04             	add    $0x4,%esp
  100504:	61                   	popa   
  100505:	cf                   	iret   

00100506 <_irq33>:
  100506:	60                   	pusha  
  100507:	6a 21                	push   $0x21
  100509:	e8 71 0e 00 00       	call   10137f <handleIRQ>
  10050e:	83 c4 04             	add    $0x4,%esp
  100511:	61                   	popa   
  100512:	cf                   	iret   

00100513 <_irq34>:
  100513:	60                   	pusha  
  100514:	6a 22                	push   $0x22
  100516:	e8 64 0e 00 00       	call   10137f <handleIRQ>
  10051b:	83 c4 04             	add    $0x4,%esp
  10051e:	61                   	popa   
  10051f:	cf                   	iret   

00100520 <_irq35>:
  100520:	60                   	pusha  
  100521:	6a 23                	push   $0x23
  100523:	e8 57 0e 00 00       	call   10137f <handleIRQ>
  100528:	83 c4 04             	add    $0x4,%esp
  10052b:	61                   	popa   
  10052c:	cf                   	iret   

0010052d <_irq36>:
  10052d:	60                   	pusha  
  10052e:	6a 24                	push   $0x24
  100530:	e8 4a 0e 00 00       	call   10137f <handleIRQ>
  100535:	83 c4 04             	add    $0x4,%esp
  100538:	61                   	popa   
  100539:	cf                   	iret   

0010053a <_irq37>:
  10053a:	60                   	pusha  
  10053b:	6a 25                	push   $0x25
  10053d:	e8 3d 0e 00 00       	call   10137f <handleIRQ>
  100542:	83 c4 04             	add    $0x4,%esp
  100545:	61                   	popa   
  100546:	cf                   	iret   

00100547 <_irq38>:
  100547:	60                   	pusha  
  100548:	6a 26                	push   $0x26
  10054a:	e8 30 0e 00 00       	call   10137f <handleIRQ>
  10054f:	83 c4 04             	add    $0x4,%esp
  100552:	61                   	popa   
  100553:	cf                   	iret   

00100554 <_irq39>:
  100554:	60                   	pusha  
  100555:	6a 27                	push   $0x27
  100557:	e8 23 0e 00 00       	call   10137f <handleIRQ>
  10055c:	83 c4 04             	add    $0x4,%esp
  10055f:	61                   	popa   
  100560:	cf                   	iret   

00100561 <_irq40>:
  100561:	60                   	pusha  
  100562:	6a 28                	push   $0x28
  100564:	e8 16 0e 00 00       	call   10137f <handleIRQ>
  100569:	83 c4 04             	add    $0x4,%esp
  10056c:	61                   	popa   
  10056d:	cf                   	iret   

0010056e <_irq41>:
  10056e:	60                   	pusha  
  10056f:	6a 29                	push   $0x29
  100571:	e8 09 0e 00 00       	call   10137f <handleIRQ>
  100576:	83 c4 04             	add    $0x4,%esp
  100579:	61                   	popa   
  10057a:	cf                   	iret   

0010057b <_irq42>:
  10057b:	60                   	pusha  
  10057c:	6a 2a                	push   $0x2a
  10057e:	e8 fc 0d 00 00       	call   10137f <handleIRQ>
  100583:	83 c4 04             	add    $0x4,%esp
  100586:	61                   	popa   
  100587:	cf                   	iret   

00100588 <_irq43>:
  100588:	60                   	pusha  
  100589:	6a 2b                	push   $0x2b
  10058b:	e8 ef 0d 00 00       	call   10137f <handleIRQ>
  100590:	83 c4 04             	add    $0x4,%esp
  100593:	61                   	popa   
  100594:	cf                   	iret   

00100595 <_irq44>:
  100595:	60                   	pusha  
  100596:	6a 2c                	push   $0x2c
  100598:	e8 e2 0d 00 00       	call   10137f <handleIRQ>
  10059d:	83 c4 04             	add    $0x4,%esp
  1005a0:	61                   	popa   
  1005a1:	cf                   	iret   

001005a2 <_irq45>:
  1005a2:	60                   	pusha  
  1005a3:	6a 2d                	push   $0x2d
  1005a5:	e8 d5 0d 00 00       	call   10137f <handleIRQ>
  1005aa:	83 c4 04             	add    $0x4,%esp
  1005ad:	61                   	popa   
  1005ae:	cf                   	iret   

001005af <_irq46>:
  1005af:	60                   	pusha  
  1005b0:	6a 2e                	push   $0x2e
  1005b2:	e8 c8 0d 00 00       	call   10137f <handleIRQ>
  1005b7:	83 c4 04             	add    $0x4,%esp
  1005ba:	61                   	popa   
  1005bb:	cf                   	iret   

001005bc <_irq47>:
  1005bc:	60                   	pusha  
  1005bd:	6a 2f                	push   $0x2f
  1005bf:	e8 bb 0d 00 00       	call   10137f <handleIRQ>
  1005c4:	83 c4 04             	add    $0x4,%esp
  1005c7:	61                   	popa   
  1005c8:	cf                   	iret   

001005c9 <loader>:
  1005c9:	fa                   	cli    
  1005ca:	bc 84 1b 30 00       	mov    $0x301b84,%esp
  1005cf:	50                   	push   %eax
  1005d0:	53                   	push   %ebx
  1005d1:	e8 40 0f 00 00       	call   101516 <kernelMain>

001005d6 <_stop>:
  1005d6:	fa                   	cli    
  1005d7:	f4                   	hlt    
  1005d8:	eb fc                	jmp    1005d6 <_stop>

001005da <setSegmentDescriptor>:
  1005da:	55                   	push   %ebp
  1005db:	89 e5                	mov    %esp,%ebp
  1005dd:	53                   	push   %ebx
  1005de:	83 ec 0c             	sub    $0xc,%esp
  1005e1:	e8 6a fd ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  1005e6:	05 7e 15 00 00       	add    $0x157e,%eax
  1005eb:	8b 55 08             	mov    0x8(%ebp),%edx
  1005ee:	8b 5d 14             	mov    0x14(%ebp),%ebx
  1005f1:	8b 4d 18             	mov    0x18(%ebp),%ecx
  1005f4:	66 89 55 f8          	mov    %dx,-0x8(%ebp)
  1005f8:	89 da                	mov    %ebx,%edx
  1005fa:	88 55 f4             	mov    %dl,-0xc(%ebp)
  1005fd:	89 ca                	mov    %ecx,%edx
  1005ff:	88 55 f0             	mov    %dl,-0x10(%ebp)
  100602:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  100606:	8b 55 10             	mov    0x10(%ebp),%edx
  100609:	89 d3                	mov    %edx,%ebx
  10060b:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  100611:	66 89 1c ca          	mov    %bx,(%edx,%ecx,8)
  100615:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  100619:	8b 55 0c             	mov    0xc(%ebp),%edx
  10061c:	89 d3                	mov    %edx,%ebx
  10061e:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  100624:	66 89 5c ca 02       	mov    %bx,0x2(%edx,%ecx,8)
  100629:	8b 55 0c             	mov    0xc(%ebp),%edx
  10062c:	c1 ea 10             	shr    $0x10,%edx
  10062f:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  100633:	89 d3                	mov    %edx,%ebx
  100635:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  10063b:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  10063f:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  100643:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  100649:	0f b6 5d f4          	movzbl -0xc(%ebp),%ebx
  10064d:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  100651:	8b 55 10             	mov    0x10(%ebp),%edx
  100654:	c1 ea 10             	shr    $0x10,%edx
  100657:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  10065b:	89 d3                	mov    %edx,%ebx
  10065d:	83 e3 0f             	and    $0xf,%ebx
  100660:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  100666:	88 5c ca 06          	mov    %bl,0x6(%edx,%ecx,8)
  10066a:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  10066e:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  100674:	0f b6 54 ca 06       	movzbl 0x6(%edx,%ecx,8),%edx
  100679:	89 d1                	mov    %edx,%ecx
  10067b:	0f b6 55 f0          	movzbl -0x10(%ebp),%edx
  10067f:	c1 e2 04             	shl    $0x4,%edx
  100682:	09 ca                	or     %ecx,%edx
  100684:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  100688:	89 d3                	mov    %edx,%ebx
  10068a:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  100690:	88 5c ca 06          	mov    %bl,0x6(%edx,%ecx,8)
  100694:	8b 55 0c             	mov    0xc(%ebp),%edx
  100697:	89 d1                	mov    %edx,%ecx
  100699:	c1 e9 18             	shr    $0x18,%ecx
  10069c:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  1006a0:	c7 c0 c0 1b 30 00    	mov    $0x301bc0,%eax
  1006a6:	88 4c d0 07          	mov    %cl,0x7(%eax,%edx,8)
  1006aa:	90                   	nop
  1006ab:	83 c4 0c             	add    $0xc,%esp
  1006ae:	5b                   	pop    %ebx
  1006af:	5d                   	pop    %ebp
  1006b0:	c3                   	ret    

001006b1 <getSegmentBase>:
  1006b1:	55                   	push   %ebp
  1006b2:	89 e5                	mov    %esp,%ebp
  1006b4:	53                   	push   %ebx
  1006b5:	83 ec 04             	sub    $0x4,%esp
  1006b8:	e8 93 fc ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  1006bd:	05 a7 14 00 00       	add    $0x14a7,%eax
  1006c2:	8b 55 08             	mov    0x8(%ebp),%edx
  1006c5:	66 89 55 f8          	mov    %dx,-0x8(%ebp)
  1006c9:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  1006cd:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  1006d3:	0f b7 54 ca 02       	movzwl 0x2(%edx,%ecx,8),%edx
  1006d8:	0f b7 da             	movzwl %dx,%ebx
  1006db:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  1006df:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  1006e5:	0f b6 54 ca 04       	movzbl 0x4(%edx,%ecx,8),%edx
  1006ea:	0f b6 d2             	movzbl %dl,%edx
  1006ed:	c1 e2 10             	shl    $0x10,%edx
  1006f0:	09 d3                	or     %edx,%ebx
  1006f2:	89 d9                	mov    %ebx,%ecx
  1006f4:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  1006f8:	c7 c0 c0 1b 30 00    	mov    $0x301bc0,%eax
  1006fe:	0f b6 44 d0 07       	movzbl 0x7(%eax,%edx,8),%eax
  100703:	0f b6 c0             	movzbl %al,%eax
  100706:	c1 e0 18             	shl    $0x18,%eax
  100709:	09 c8                	or     %ecx,%eax
  10070b:	83 c4 04             	add    $0x4,%esp
  10070e:	5b                   	pop    %ebx
  10070f:	5d                   	pop    %ebp
  100710:	c3                   	ret    

00100711 <getSegmentLimit>:
  100711:	55                   	push   %ebp
  100712:	89 e5                	mov    %esp,%ebp
  100714:	83 ec 04             	sub    $0x4,%esp
  100717:	e8 34 fc ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  10071c:	05 48 14 00 00       	add    $0x1448,%eax
  100721:	8b 55 08             	mov    0x8(%ebp),%edx
  100724:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100728:	0f b7 4d fc          	movzwl -0x4(%ebp),%ecx
  10072c:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  100732:	0f b7 14 ca          	movzwl (%edx,%ecx,8),%edx
  100736:	0f b7 ca             	movzwl %dx,%ecx
  100739:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  10073d:	c7 c0 c0 1b 30 00    	mov    $0x301bc0,%eax
  100743:	0f b6 44 d0 06       	movzbl 0x6(%eax,%edx,8),%eax
  100748:	0f b6 c0             	movzbl %al,%eax
  10074b:	25 00 00 0f 00       	and    $0xf0000,%eax
  100750:	09 c8                	or     %ecx,%eax
  100752:	c9                   	leave  
  100753:	c3                   	ret    

00100754 <getSegmentFlags>:
  100754:	55                   	push   %ebp
  100755:	89 e5                	mov    %esp,%ebp
  100757:	83 ec 04             	sub    $0x4,%esp
  10075a:	e8 f1 fb ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  10075f:	05 05 14 00 00       	add    $0x1405,%eax
  100764:	8b 55 08             	mov    0x8(%ebp),%edx
  100767:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  10076b:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  10076f:	c7 c0 c0 1b 30 00    	mov    $0x301bc0,%eax
  100775:	0f b6 44 d0 06       	movzbl 0x6(%eax,%edx,8),%eax
  10077a:	c0 e8 04             	shr    $0x4,%al
  10077d:	c9                   	leave  
  10077e:	c3                   	ret    

0010077f <setSegmentBase>:
  10077f:	55                   	push   %ebp
  100780:	89 e5                	mov    %esp,%ebp
  100782:	53                   	push   %ebx
  100783:	83 ec 04             	sub    $0x4,%esp
  100786:	e8 c5 fb ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  10078b:	05 d9 13 00 00       	add    $0x13d9,%eax
  100790:	8b 55 08             	mov    0x8(%ebp),%edx
  100793:	66 89 55 f8          	mov    %dx,-0x8(%ebp)
  100797:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  10079b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10079e:	89 d3                	mov    %edx,%ebx
  1007a0:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  1007a6:	66 89 5c ca 02       	mov    %bx,0x2(%edx,%ecx,8)
  1007ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007ae:	c1 ea 10             	shr    $0x10,%edx
  1007b1:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  1007b5:	89 d3                	mov    %edx,%ebx
  1007b7:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  1007bd:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  1007c1:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007c4:	89 d1                	mov    %edx,%ecx
  1007c6:	c1 e9 18             	shr    $0x18,%ecx
  1007c9:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  1007cd:	c7 c0 c0 1b 30 00    	mov    $0x301bc0,%eax
  1007d3:	88 4c d0 07          	mov    %cl,0x7(%eax,%edx,8)
  1007d7:	90                   	nop
  1007d8:	83 c4 04             	add    $0x4,%esp
  1007db:	5b                   	pop    %ebx
  1007dc:	5d                   	pop    %ebp
  1007dd:	c3                   	ret    

001007de <setSegmentLimit>:
  1007de:	55                   	push   %ebp
  1007df:	89 e5                	mov    %esp,%ebp
  1007e1:	53                   	push   %ebx
  1007e2:	83 ec 04             	sub    $0x4,%esp
  1007e5:	e8 66 fb ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  1007ea:	05 7a 13 00 00       	add    $0x137a,%eax
  1007ef:	8b 55 08             	mov    0x8(%ebp),%edx
  1007f2:	66 89 55 f8          	mov    %dx,-0x8(%ebp)
  1007f6:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  1007fa:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007fd:	89 d3                	mov    %edx,%ebx
  1007ff:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  100805:	66 89 1c ca          	mov    %bx,(%edx,%ecx,8)
  100809:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  10080d:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  100813:	0f b6 54 ca 06       	movzbl 0x6(%edx,%ecx,8),%edx
  100818:	89 d1                	mov    %edx,%ecx
  10081a:	8b 55 0c             	mov    0xc(%ebp),%edx
  10081d:	c1 ea 10             	shr    $0x10,%edx
  100820:	83 e2 0f             	and    $0xf,%edx
  100823:	09 d1                	or     %edx,%ecx
  100825:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100829:	c7 c0 c0 1b 30 00    	mov    $0x301bc0,%eax
  10082f:	88 4c d0 06          	mov    %cl,0x6(%eax,%edx,8)
  100833:	90                   	nop
  100834:	83 c4 04             	add    $0x4,%esp
  100837:	5b                   	pop    %ebx
  100838:	5d                   	pop    %ebp
  100839:	c3                   	ret    

0010083a <setSegmentFlags>:
  10083a:	55                   	push   %ebp
  10083b:	89 e5                	mov    %esp,%ebp
  10083d:	83 ec 08             	sub    $0x8,%esp
  100840:	e8 0b fb ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  100845:	05 1f 13 00 00       	add    $0x131f,%eax
  10084a:	8b 55 08             	mov    0x8(%ebp),%edx
  10084d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100850:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100854:	89 ca                	mov    %ecx,%edx
  100856:	88 55 f8             	mov    %dl,-0x8(%ebp)
  100859:	0f b7 4d fc          	movzwl -0x4(%ebp),%ecx
  10085d:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  100863:	0f b6 54 ca 06       	movzbl 0x6(%edx,%ecx,8),%edx
  100868:	89 d1                	mov    %edx,%ecx
  10086a:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
  10086e:	c1 e2 04             	shl    $0x4,%edx
  100871:	09 d1                	or     %edx,%ecx
  100873:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100877:	c7 c0 c0 1b 30 00    	mov    $0x301bc0,%eax
  10087d:	88 4c d0 06          	mov    %cl,0x6(%eax,%edx,8)
  100881:	90                   	nop
  100882:	c9                   	leave  
  100883:	c3                   	ret    

00100884 <flushGDT>:
  100884:	55                   	push   %ebp
  100885:	89 e5                	mov    %esp,%ebp
  100887:	83 ec 10             	sub    $0x10,%esp
  10088a:	e8 c1 fa ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  10088f:	05 d5 12 00 00       	add    $0x12d5,%eax
  100894:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10089b:	eb 1c                	jmp    1008b9 <flushGDT+0x35>
  10089d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1008a0:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  1008a7:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  1008ad:	01 ca                	add    %ecx,%edx
  1008af:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  1008b5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1008b9:	81 7d fc ff ff 01 00 	cmpl   $0x1ffff,-0x4(%ebp)
  1008c0:	76 db                	jbe    10089d <flushGDT+0x19>
  1008c2:	90                   	nop
  1008c3:	90                   	nop
  1008c4:	c9                   	leave  
  1008c5:	c3                   	ret    

001008c6 <loadGDT>:
  1008c6:	55                   	push   %ebp
  1008c7:	89 e5                	mov    %esp,%ebp
  1008c9:	83 ec 04             	sub    $0x4,%esp
  1008cc:	e8 7f fa ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  1008d1:	05 93 12 00 00       	add    $0x1293,%eax
  1008d6:	8b 55 08             	mov    0x8(%ebp),%edx
  1008d9:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  1008dd:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1008e1:	c1 e2 03             	shl    $0x3,%edx
  1008e4:	8d 4a ff             	lea    -0x1(%edx),%ecx
  1008e7:	c7 c2 a0 1b 30 00    	mov    $0x301ba0,%edx
  1008ed:	66 89 0a             	mov    %cx,(%edx)
  1008f0:	c7 c2 c0 1b 30 00    	mov    $0x301bc0,%edx
  1008f6:	89 d1                	mov    %edx,%ecx
  1008f8:	c7 c2 a0 1b 30 00    	mov    $0x301ba0,%edx
  1008fe:	89 4a 02             	mov    %ecx,0x2(%edx)
  100901:	c7 c0 a0 1b 30 00    	mov    $0x301ba0,%eax
  100907:	0f 01 10             	lgdtl  (%eax)
  10090a:	90                   	nop
  10090b:	c9                   	leave  
  10090c:	c3                   	ret    

0010090d <setGateDescriptor>:
  10090d:	55                   	push   %ebp
  10090e:	89 e5                	mov    %esp,%ebp
  100910:	53                   	push   %ebx
  100911:	83 ec 0c             	sub    $0xc,%esp
  100914:	e8 37 fa ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  100919:	05 4b 12 00 00       	add    $0x124b,%eax
  10091e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100921:	8b 55 10             	mov    0x10(%ebp),%edx
  100924:	8b 4d 14             	mov    0x14(%ebp),%ecx
  100927:	88 5d f8             	mov    %bl,-0x8(%ebp)
  10092a:	66 89 55 f4          	mov    %dx,-0xc(%ebp)
  10092e:	89 ca                	mov    %ecx,%edx
  100930:	88 55 f0             	mov    %dl,-0x10(%ebp)
  100933:	0f b6 4d f8          	movzbl -0x8(%ebp),%ecx
  100937:	8b 55 0c             	mov    0xc(%ebp),%edx
  10093a:	89 d3                	mov    %edx,%ebx
  10093c:	c7 c2 e0 1b 38 00    	mov    $0x381be0,%edx
  100942:	66 89 1c ca          	mov    %bx,(%edx,%ecx,8)
  100946:	0f b6 4d f8          	movzbl -0x8(%ebp),%ecx
  10094a:	c7 c2 e0 1b 38 00    	mov    $0x381be0,%edx
  100950:	0f b7 5d f4          	movzwl -0xc(%ebp),%ebx
  100954:	66 89 5c ca 02       	mov    %bx,0x2(%edx,%ecx,8)
  100959:	0f b6 4d f8          	movzbl -0x8(%ebp),%ecx
  10095d:	c7 c2 e0 1b 38 00    	mov    $0x381be0,%edx
  100963:	c6 44 ca 04 00       	movb   $0x0,0x4(%edx,%ecx,8)
  100968:	0f b6 4d f8          	movzbl -0x8(%ebp),%ecx
  10096c:	c7 c2 e0 1b 38 00    	mov    $0x381be0,%edx
  100972:	0f b6 5d f0          	movzbl -0x10(%ebp),%ebx
  100976:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  10097a:	8b 55 0c             	mov    0xc(%ebp),%edx
  10097d:	89 d1                	mov    %edx,%ecx
  10097f:	c1 e9 10             	shr    $0x10,%ecx
  100982:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
  100986:	c7 c0 e0 1b 38 00    	mov    $0x381be0,%eax
  10098c:	66 89 4c d0 06       	mov    %cx,0x6(%eax,%edx,8)
  100991:	90                   	nop
  100992:	83 c4 0c             	add    $0xc,%esp
  100995:	5b                   	pop    %ebx
  100996:	5d                   	pop    %ebp
  100997:	c3                   	ret    

00100998 <getGateOffset>:
  100998:	55                   	push   %ebp
  100999:	89 e5                	mov    %esp,%ebp
  10099b:	83 ec 04             	sub    $0x4,%esp
  10099e:	e8 ad f9 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  1009a3:	05 c1 11 00 00       	add    $0x11c1,%eax
  1009a8:	8b 55 08             	mov    0x8(%ebp),%edx
  1009ab:	88 55 fc             	mov    %dl,-0x4(%ebp)
  1009ae:	0f b6 4d fc          	movzbl -0x4(%ebp),%ecx
  1009b2:	c7 c2 e0 1b 38 00    	mov    $0x381be0,%edx
  1009b8:	0f b7 14 ca          	movzwl (%edx,%ecx,8),%edx
  1009bc:	0f b7 ca             	movzwl %dx,%ecx
  1009bf:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
  1009c3:	c7 c0 e0 1b 38 00    	mov    $0x381be0,%eax
  1009c9:	0f b7 44 d0 06       	movzwl 0x6(%eax,%edx,8),%eax
  1009ce:	0f b7 c0             	movzwl %ax,%eax
  1009d1:	c1 e0 10             	shl    $0x10,%eax
  1009d4:	09 c8                	or     %ecx,%eax
  1009d6:	c9                   	leave  
  1009d7:	c3                   	ret    

001009d8 <setGateOffset>:
  1009d8:	55                   	push   %ebp
  1009d9:	89 e5                	mov    %esp,%ebp
  1009db:	53                   	push   %ebx
  1009dc:	83 ec 04             	sub    $0x4,%esp
  1009df:	e8 6c f9 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  1009e4:	05 80 11 00 00       	add    $0x1180,%eax
  1009e9:	8b 55 08             	mov    0x8(%ebp),%edx
  1009ec:	88 55 f8             	mov    %dl,-0x8(%ebp)
  1009ef:	0f b6 4d f8          	movzbl -0x8(%ebp),%ecx
  1009f3:	8b 55 0c             	mov    0xc(%ebp),%edx
  1009f6:	89 d3                	mov    %edx,%ebx
  1009f8:	c7 c2 e0 1b 38 00    	mov    $0x381be0,%edx
  1009fe:	66 89 1c ca          	mov    %bx,(%edx,%ecx,8)
  100a02:	8b 55 0c             	mov    0xc(%ebp),%edx
  100a05:	89 d1                	mov    %edx,%ecx
  100a07:	c1 e9 10             	shr    $0x10,%ecx
  100a0a:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
  100a0e:	c7 c0 e0 1b 38 00    	mov    $0x381be0,%eax
  100a14:	66 89 4c d0 06       	mov    %cx,0x6(%eax,%edx,8)
  100a19:	90                   	nop
  100a1a:	83 c4 04             	add    $0x4,%esp
  100a1d:	5b                   	pop    %ebx
  100a1e:	5d                   	pop    %ebp
  100a1f:	c3                   	ret    

00100a20 <flushIDT>:
  100a20:	55                   	push   %ebp
  100a21:	89 e5                	mov    %esp,%ebp
  100a23:	83 ec 10             	sub    $0x10,%esp
  100a26:	e8 25 f9 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  100a2b:	05 39 11 00 00       	add    $0x1139,%eax
  100a30:	66 c7 45 fe 00 00    	movw   $0x0,-0x2(%ebp)
  100a36:	eb 24                	jmp    100a5c <flushIDT+0x3c>
  100a38:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  100a3c:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  100a43:	c7 c2 e0 1b 38 00    	mov    $0x381be0,%edx
  100a49:	01 ca                	add    %ecx,%edx
  100a4b:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  100a51:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  100a55:	83 c2 01             	add    $0x1,%edx
  100a58:	66 89 55 fe          	mov    %dx,-0x2(%ebp)
  100a5c:	66 81 7d fe ff 01    	cmpw   $0x1ff,-0x2(%ebp)
  100a62:	76 d4                	jbe    100a38 <flushIDT+0x18>
  100a64:	90                   	nop
  100a65:	90                   	nop
  100a66:	c9                   	leave  
  100a67:	c3                   	ret    

00100a68 <loadIDT>:
  100a68:	55                   	push   %ebp
  100a69:	89 e5                	mov    %esp,%ebp
  100a6b:	e8 e0 f8 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  100a70:	05 f4 10 00 00       	add    $0x10f4,%eax
  100a75:	c7 c2 c0 1b 38 00    	mov    $0x381bc0,%edx
  100a7b:	66 c7 02 ff 07       	movw   $0x7ff,(%edx)
  100a80:	c7 c2 e0 1b 38 00    	mov    $0x381be0,%edx
  100a86:	89 d1                	mov    %edx,%ecx
  100a88:	c7 c2 c0 1b 38 00    	mov    $0x381bc0,%edx
  100a8e:	89 4a 02             	mov    %ecx,0x2(%edx)
  100a91:	c7 c0 c0 1b 38 00    	mov    $0x381bc0,%eax
  100a97:	0f 01 18             	lidtl  (%eax)
  100a9a:	90                   	nop
  100a9b:	5d                   	pop    %ebp
  100a9c:	c3                   	ret    

00100a9d <ind>:
  100a9d:	55                   	push   %ebp
  100a9e:	89 e5                	mov    %esp,%ebp
  100aa0:	83 ec 14             	sub    $0x14,%esp
  100aa3:	e8 a8 f8 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  100aa8:	05 bc 10 00 00       	add    $0x10bc,%eax
  100aad:	8b 45 08             	mov    0x8(%ebp),%eax
  100ab0:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  100ab4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100abb:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
  100abf:	66 89 ca             	mov    %cx,%dx
  100ac2:	ed                   	in     (%dx),%eax
  100ac3:	89 c1                	mov    %eax,%ecx
  100ac5:	89 4d fc             	mov    %ecx,-0x4(%ebp)
  100ac8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100acb:	c9                   	leave  
  100acc:	c3                   	ret    

00100acd <outd>:
  100acd:	55                   	push   %ebp
  100ace:	89 e5                	mov    %esp,%ebp
  100ad0:	53                   	push   %ebx
  100ad1:	83 ec 04             	sub    $0x4,%esp
  100ad4:	e8 77 f8 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  100ad9:	05 8b 10 00 00       	add    $0x108b,%eax
  100ade:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae1:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100ae5:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  100ae9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100aec:	66 89 ca             	mov    %cx,%dx
  100aef:	89 d8                	mov    %ebx,%eax
  100af1:	ef                   	out    %eax,(%dx)
  100af2:	90                   	nop
  100af3:	83 c4 04             	add    $0x4,%esp
  100af6:	5b                   	pop    %ebx
  100af7:	5d                   	pop    %ebp
  100af8:	c3                   	ret    

00100af9 <inw>:
  100af9:	55                   	push   %ebp
  100afa:	89 e5                	mov    %esp,%ebp
  100afc:	83 ec 14             	sub    $0x14,%esp
  100aff:	e8 4c f8 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  100b04:	05 60 10 00 00       	add    $0x1060,%eax
  100b09:	8b 45 08             	mov    0x8(%ebp),%eax
  100b0c:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  100b10:	66 c7 45 fe 00 00    	movw   $0x0,-0x2(%ebp)
  100b16:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
  100b1a:	66 89 ca             	mov    %cx,%dx
  100b1d:	66 ed                	in     (%dx),%ax
  100b1f:	66 89 c1             	mov    %ax,%cx
  100b22:	66 89 4d fe          	mov    %cx,-0x2(%ebp)
  100b26:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100b2a:	c9                   	leave  
  100b2b:	c3                   	ret    

00100b2c <outw>:
  100b2c:	55                   	push   %ebp
  100b2d:	89 e5                	mov    %esp,%ebp
  100b2f:	53                   	push   %ebx
  100b30:	83 ec 08             	sub    $0x8,%esp
  100b33:	e8 18 f8 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  100b38:	05 2c 10 00 00       	add    $0x102c,%eax
  100b3d:	8b 55 08             	mov    0x8(%ebp),%edx
  100b40:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b43:	66 89 55 f8          	mov    %dx,-0x8(%ebp)
  100b47:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  100b4b:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  100b4f:	0f b7 5d f4          	movzwl -0xc(%ebp),%ebx
  100b53:	66 89 ca             	mov    %cx,%dx
  100b56:	66 89 d8             	mov    %bx,%ax
  100b59:	66 ef                	out    %ax,(%dx)
  100b5b:	90                   	nop
  100b5c:	83 c4 08             	add    $0x8,%esp
  100b5f:	5b                   	pop    %ebx
  100b60:	5d                   	pop    %ebp
  100b61:	c3                   	ret    

00100b62 <inb>:
  100b62:	55                   	push   %ebp
  100b63:	89 e5                	mov    %esp,%ebp
  100b65:	83 ec 14             	sub    $0x14,%esp
  100b68:	e8 e3 f7 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  100b6d:	05 f7 0f 00 00       	add    $0xff7,%eax
  100b72:	8b 45 08             	mov    0x8(%ebp),%eax
  100b75:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  100b79:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
  100b7d:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
  100b81:	66 89 ca             	mov    %cx,%dx
  100b84:	ec                   	in     (%dx),%al
  100b85:	88 c1                	mov    %al,%cl
  100b87:	88 4d ff             	mov    %cl,-0x1(%ebp)
  100b8a:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  100b8e:	c9                   	leave  
  100b8f:	c3                   	ret    

00100b90 <outb>:
  100b90:	55                   	push   %ebp
  100b91:	89 e5                	mov    %esp,%ebp
  100b93:	53                   	push   %ebx
  100b94:	83 ec 08             	sub    $0x8,%esp
  100b97:	e8 b4 f7 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  100b9c:	05 c8 0f 00 00       	add    $0xfc8,%eax
  100ba1:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba4:	8b 55 0c             	mov    0xc(%ebp),%edx
  100ba7:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100bab:	89 d0                	mov    %edx,%eax
  100bad:	88 45 f4             	mov    %al,-0xc(%ebp)
  100bb0:	0f b7 4d f8          	movzwl -0x8(%ebp),%ecx
  100bb4:	0f b6 5d f4          	movzbl -0xc(%ebp),%ebx
  100bb8:	66 89 ca             	mov    %cx,%dx
  100bbb:	88 d8                	mov    %bl,%al
  100bbd:	ee                   	out    %al,(%dx)
  100bbe:	90                   	nop
  100bbf:	83 c4 08             	add    $0x8,%esp
  100bc2:	5b                   	pop    %ebx
  100bc3:	5d                   	pop    %ebp
  100bc4:	c3                   	ret    

00100bc5 <initializeIDT>:
  100bc5:	55                   	push   %ebp
  100bc6:	89 e5                	mov    %esp,%ebp
  100bc8:	56                   	push   %esi
  100bc9:	53                   	push   %ebx
  100bca:	83 ec 20             	sub    $0x20,%esp
  100bcd:	e8 82 f7 ff ff       	call   100354 <__x86.get_pc_thunk.bx>
  100bd2:	81 c3 92 0f 00 00    	add    $0xf92,%ebx
  100bd8:	8b 45 08             	mov    0x8(%ebp),%eax
  100bdb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100bde:	8b 55 10             	mov    0x10(%ebp),%edx
  100be1:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  100be5:	89 c8                	mov    %ecx,%eax
  100be7:	88 45 e0             	mov    %al,-0x20(%ebp)
  100bea:	89 d0                	mov    %edx,%eax
  100bec:	88 45 dc             	mov    %al,-0x24(%ebp)
  100bef:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
  100bf5:	eb 2e                	jmp    100c25 <initializeIDT+0x60>
  100bf7:	0f b6 4d dc          	movzbl -0x24(%ebp),%ecx
  100bfb:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  100bff:	c7 c0 f8 04 10 00    	mov    $0x1004f8,%eax
  100c05:	89 c6                	mov    %eax,%esi
  100c07:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100c0b:	0f b6 c0             	movzbl %al,%eax
  100c0e:	51                   	push   %ecx
  100c0f:	52                   	push   %edx
  100c10:	56                   	push   %esi
  100c11:	50                   	push   %eax
  100c12:	e8 f6 fc ff ff       	call   10090d <setGateDescriptor>
  100c17:	83 c4 10             	add    $0x10,%esp
  100c1a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100c1e:	83 c0 01             	add    $0x1,%eax
  100c21:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  100c25:	66 81 7d f6 ff 00    	cmpw   $0xff,-0xa(%ebp)
  100c2b:	76 ca                	jbe    100bf7 <initializeIDT+0x32>
  100c2d:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100c31:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100c35:	c7 c1 58 03 10 00    	mov    $0x100358,%ecx
  100c3b:	52                   	push   %edx
  100c3c:	50                   	push   %eax
  100c3d:	51                   	push   %ecx
  100c3e:	6a 00                	push   $0x0
  100c40:	e8 c8 fc ff ff       	call   10090d <setGateDescriptor>
  100c45:	83 c4 10             	add    $0x10,%esp
  100c48:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100c4c:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100c50:	c7 c1 65 03 10 00    	mov    $0x100365,%ecx
  100c56:	52                   	push   %edx
  100c57:	50                   	push   %eax
  100c58:	51                   	push   %ecx
  100c59:	6a 01                	push   $0x1
  100c5b:	e8 ad fc ff ff       	call   10090d <setGateDescriptor>
  100c60:	83 c4 10             	add    $0x10,%esp
  100c63:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100c67:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100c6b:	c7 c1 72 03 10 00    	mov    $0x100372,%ecx
  100c71:	52                   	push   %edx
  100c72:	50                   	push   %eax
  100c73:	51                   	push   %ecx
  100c74:	6a 02                	push   $0x2
  100c76:	e8 92 fc ff ff       	call   10090d <setGateDescriptor>
  100c7b:	83 c4 10             	add    $0x10,%esp
  100c7e:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100c82:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100c86:	c7 c1 7f 03 10 00    	mov    $0x10037f,%ecx
  100c8c:	52                   	push   %edx
  100c8d:	50                   	push   %eax
  100c8e:	51                   	push   %ecx
  100c8f:	6a 03                	push   $0x3
  100c91:	e8 77 fc ff ff       	call   10090d <setGateDescriptor>
  100c96:	83 c4 10             	add    $0x10,%esp
  100c99:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100c9d:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100ca1:	c7 c1 8c 03 10 00    	mov    $0x10038c,%ecx
  100ca7:	52                   	push   %edx
  100ca8:	50                   	push   %eax
  100ca9:	51                   	push   %ecx
  100caa:	6a 04                	push   $0x4
  100cac:	e8 5c fc ff ff       	call   10090d <setGateDescriptor>
  100cb1:	83 c4 10             	add    $0x10,%esp
  100cb4:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100cb8:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100cbc:	c7 c1 99 03 10 00    	mov    $0x100399,%ecx
  100cc2:	52                   	push   %edx
  100cc3:	50                   	push   %eax
  100cc4:	51                   	push   %ecx
  100cc5:	6a 05                	push   $0x5
  100cc7:	e8 41 fc ff ff       	call   10090d <setGateDescriptor>
  100ccc:	83 c4 10             	add    $0x10,%esp
  100ccf:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100cd3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100cd7:	c7 c1 a6 03 10 00    	mov    $0x1003a6,%ecx
  100cdd:	52                   	push   %edx
  100cde:	50                   	push   %eax
  100cdf:	51                   	push   %ecx
  100ce0:	6a 06                	push   $0x6
  100ce2:	e8 26 fc ff ff       	call   10090d <setGateDescriptor>
  100ce7:	83 c4 10             	add    $0x10,%esp
  100cea:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100cee:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100cf2:	c7 c1 b3 03 10 00    	mov    $0x1003b3,%ecx
  100cf8:	52                   	push   %edx
  100cf9:	50                   	push   %eax
  100cfa:	51                   	push   %ecx
  100cfb:	6a 07                	push   $0x7
  100cfd:	e8 0b fc ff ff       	call   10090d <setGateDescriptor>
  100d02:	83 c4 10             	add    $0x10,%esp
  100d05:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100d09:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100d0d:	c7 c1 c0 03 10 00    	mov    $0x1003c0,%ecx
  100d13:	52                   	push   %edx
  100d14:	50                   	push   %eax
  100d15:	51                   	push   %ecx
  100d16:	6a 08                	push   $0x8
  100d18:	e8 f0 fb ff ff       	call   10090d <setGateDescriptor>
  100d1d:	83 c4 10             	add    $0x10,%esp
  100d20:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100d24:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100d28:	c7 c1 cd 03 10 00    	mov    $0x1003cd,%ecx
  100d2e:	52                   	push   %edx
  100d2f:	50                   	push   %eax
  100d30:	51                   	push   %ecx
  100d31:	6a 09                	push   $0x9
  100d33:	e8 d5 fb ff ff       	call   10090d <setGateDescriptor>
  100d38:	83 c4 10             	add    $0x10,%esp
  100d3b:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100d3f:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100d43:	c7 c1 da 03 10 00    	mov    $0x1003da,%ecx
  100d49:	52                   	push   %edx
  100d4a:	50                   	push   %eax
  100d4b:	51                   	push   %ecx
  100d4c:	6a 0a                	push   $0xa
  100d4e:	e8 ba fb ff ff       	call   10090d <setGateDescriptor>
  100d53:	83 c4 10             	add    $0x10,%esp
  100d56:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100d5a:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100d5e:	c7 c1 e7 03 10 00    	mov    $0x1003e7,%ecx
  100d64:	52                   	push   %edx
  100d65:	50                   	push   %eax
  100d66:	51                   	push   %ecx
  100d67:	6a 0b                	push   $0xb
  100d69:	e8 9f fb ff ff       	call   10090d <setGateDescriptor>
  100d6e:	83 c4 10             	add    $0x10,%esp
  100d71:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100d75:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100d79:	c7 c1 f4 03 10 00    	mov    $0x1003f4,%ecx
  100d7f:	52                   	push   %edx
  100d80:	50                   	push   %eax
  100d81:	51                   	push   %ecx
  100d82:	6a 0c                	push   $0xc
  100d84:	e8 84 fb ff ff       	call   10090d <setGateDescriptor>
  100d89:	83 c4 10             	add    $0x10,%esp
  100d8c:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100d90:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100d94:	c7 c1 01 04 10 00    	mov    $0x100401,%ecx
  100d9a:	52                   	push   %edx
  100d9b:	50                   	push   %eax
  100d9c:	51                   	push   %ecx
  100d9d:	6a 0d                	push   $0xd
  100d9f:	e8 69 fb ff ff       	call   10090d <setGateDescriptor>
  100da4:	83 c4 10             	add    $0x10,%esp
  100da7:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100dab:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100daf:	c7 c1 0e 04 10 00    	mov    $0x10040e,%ecx
  100db5:	52                   	push   %edx
  100db6:	50                   	push   %eax
  100db7:	51                   	push   %ecx
  100db8:	6a 0e                	push   $0xe
  100dba:	e8 4e fb ff ff       	call   10090d <setGateDescriptor>
  100dbf:	83 c4 10             	add    $0x10,%esp
  100dc2:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100dc6:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100dca:	c7 c1 1b 04 10 00    	mov    $0x10041b,%ecx
  100dd0:	52                   	push   %edx
  100dd1:	50                   	push   %eax
  100dd2:	51                   	push   %ecx
  100dd3:	6a 0f                	push   $0xf
  100dd5:	e8 33 fb ff ff       	call   10090d <setGateDescriptor>
  100dda:	83 c4 10             	add    $0x10,%esp
  100ddd:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100de1:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100de5:	c7 c1 28 04 10 00    	mov    $0x100428,%ecx
  100deb:	52                   	push   %edx
  100dec:	50                   	push   %eax
  100ded:	51                   	push   %ecx
  100dee:	6a 10                	push   $0x10
  100df0:	e8 18 fb ff ff       	call   10090d <setGateDescriptor>
  100df5:	83 c4 10             	add    $0x10,%esp
  100df8:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100dfc:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100e00:	c7 c1 35 04 10 00    	mov    $0x100435,%ecx
  100e06:	52                   	push   %edx
  100e07:	50                   	push   %eax
  100e08:	51                   	push   %ecx
  100e09:	6a 11                	push   $0x11
  100e0b:	e8 fd fa ff ff       	call   10090d <setGateDescriptor>
  100e10:	83 c4 10             	add    $0x10,%esp
  100e13:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100e17:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100e1b:	c7 c1 42 04 10 00    	mov    $0x100442,%ecx
  100e21:	52                   	push   %edx
  100e22:	50                   	push   %eax
  100e23:	51                   	push   %ecx
  100e24:	6a 12                	push   $0x12
  100e26:	e8 e2 fa ff ff       	call   10090d <setGateDescriptor>
  100e2b:	83 c4 10             	add    $0x10,%esp
  100e2e:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100e32:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100e36:	c7 c1 4f 04 10 00    	mov    $0x10044f,%ecx
  100e3c:	52                   	push   %edx
  100e3d:	50                   	push   %eax
  100e3e:	51                   	push   %ecx
  100e3f:	6a 13                	push   $0x13
  100e41:	e8 c7 fa ff ff       	call   10090d <setGateDescriptor>
  100e46:	83 c4 10             	add    $0x10,%esp
  100e49:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100e4d:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100e51:	c7 c1 5c 04 10 00    	mov    $0x10045c,%ecx
  100e57:	52                   	push   %edx
  100e58:	50                   	push   %eax
  100e59:	51                   	push   %ecx
  100e5a:	6a 14                	push   $0x14
  100e5c:	e8 ac fa ff ff       	call   10090d <setGateDescriptor>
  100e61:	83 c4 10             	add    $0x10,%esp
  100e64:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100e68:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100e6c:	c7 c1 69 04 10 00    	mov    $0x100469,%ecx
  100e72:	52                   	push   %edx
  100e73:	50                   	push   %eax
  100e74:	51                   	push   %ecx
  100e75:	6a 15                	push   $0x15
  100e77:	e8 91 fa ff ff       	call   10090d <setGateDescriptor>
  100e7c:	83 c4 10             	add    $0x10,%esp
  100e7f:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100e83:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100e87:	c7 c1 76 04 10 00    	mov    $0x100476,%ecx
  100e8d:	52                   	push   %edx
  100e8e:	50                   	push   %eax
  100e8f:	51                   	push   %ecx
  100e90:	6a 16                	push   $0x16
  100e92:	e8 76 fa ff ff       	call   10090d <setGateDescriptor>
  100e97:	83 c4 10             	add    $0x10,%esp
  100e9a:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100e9e:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100ea2:	c7 c1 83 04 10 00    	mov    $0x100483,%ecx
  100ea8:	52                   	push   %edx
  100ea9:	50                   	push   %eax
  100eaa:	51                   	push   %ecx
  100eab:	6a 17                	push   $0x17
  100ead:	e8 5b fa ff ff       	call   10090d <setGateDescriptor>
  100eb2:	83 c4 10             	add    $0x10,%esp
  100eb5:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100eb9:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100ebd:	c7 c1 90 04 10 00    	mov    $0x100490,%ecx
  100ec3:	52                   	push   %edx
  100ec4:	50                   	push   %eax
  100ec5:	51                   	push   %ecx
  100ec6:	6a 18                	push   $0x18
  100ec8:	e8 40 fa ff ff       	call   10090d <setGateDescriptor>
  100ecd:	83 c4 10             	add    $0x10,%esp
  100ed0:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100ed4:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100ed8:	c7 c1 9d 04 10 00    	mov    $0x10049d,%ecx
  100ede:	52                   	push   %edx
  100edf:	50                   	push   %eax
  100ee0:	51                   	push   %ecx
  100ee1:	6a 19                	push   $0x19
  100ee3:	e8 25 fa ff ff       	call   10090d <setGateDescriptor>
  100ee8:	83 c4 10             	add    $0x10,%esp
  100eeb:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100eef:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100ef3:	c7 c1 aa 04 10 00    	mov    $0x1004aa,%ecx
  100ef9:	52                   	push   %edx
  100efa:	50                   	push   %eax
  100efb:	51                   	push   %ecx
  100efc:	6a 1a                	push   $0x1a
  100efe:	e8 0a fa ff ff       	call   10090d <setGateDescriptor>
  100f03:	83 c4 10             	add    $0x10,%esp
  100f06:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100f0a:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f0e:	c7 c1 b7 04 10 00    	mov    $0x1004b7,%ecx
  100f14:	52                   	push   %edx
  100f15:	50                   	push   %eax
  100f16:	51                   	push   %ecx
  100f17:	6a 1b                	push   $0x1b
  100f19:	e8 ef f9 ff ff       	call   10090d <setGateDescriptor>
  100f1e:	83 c4 10             	add    $0x10,%esp
  100f21:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100f25:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f29:	c7 c1 c4 04 10 00    	mov    $0x1004c4,%ecx
  100f2f:	52                   	push   %edx
  100f30:	50                   	push   %eax
  100f31:	51                   	push   %ecx
  100f32:	6a 1c                	push   $0x1c
  100f34:	e8 d4 f9 ff ff       	call   10090d <setGateDescriptor>
  100f39:	83 c4 10             	add    $0x10,%esp
  100f3c:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100f40:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f44:	c7 c1 d1 04 10 00    	mov    $0x1004d1,%ecx
  100f4a:	52                   	push   %edx
  100f4b:	50                   	push   %eax
  100f4c:	51                   	push   %ecx
  100f4d:	6a 1d                	push   $0x1d
  100f4f:	e8 b9 f9 ff ff       	call   10090d <setGateDescriptor>
  100f54:	83 c4 10             	add    $0x10,%esp
  100f57:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100f5b:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f5f:	c7 c1 de 04 10 00    	mov    $0x1004de,%ecx
  100f65:	52                   	push   %edx
  100f66:	50                   	push   %eax
  100f67:	51                   	push   %ecx
  100f68:	6a 1e                	push   $0x1e
  100f6a:	e8 9e f9 ff ff       	call   10090d <setGateDescriptor>
  100f6f:	83 c4 10             	add    $0x10,%esp
  100f72:	0f b6 55 e0          	movzbl -0x20(%ebp),%edx
  100f76:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f7a:	c7 c1 eb 04 10 00    	mov    $0x1004eb,%ecx
  100f80:	52                   	push   %edx
  100f81:	50                   	push   %eax
  100f82:	51                   	push   %ecx
  100f83:	6a 1f                	push   $0x1f
  100f85:	e8 83 f9 ff ff       	call   10090d <setGateDescriptor>
  100f8a:	83 c4 10             	add    $0x10,%esp
  100f8d:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  100f91:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f95:	c7 c1 f9 04 10 00    	mov    $0x1004f9,%ecx
  100f9b:	52                   	push   %edx
  100f9c:	50                   	push   %eax
  100f9d:	51                   	push   %ecx
  100f9e:	6a 20                	push   $0x20
  100fa0:	e8 68 f9 ff ff       	call   10090d <setGateDescriptor>
  100fa5:	83 c4 10             	add    $0x10,%esp
  100fa8:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  100fac:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100fb0:	c7 c1 06 05 10 00    	mov    $0x100506,%ecx
  100fb6:	52                   	push   %edx
  100fb7:	50                   	push   %eax
  100fb8:	51                   	push   %ecx
  100fb9:	6a 21                	push   $0x21
  100fbb:	e8 4d f9 ff ff       	call   10090d <setGateDescriptor>
  100fc0:	83 c4 10             	add    $0x10,%esp
  100fc3:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  100fc7:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100fcb:	c7 c1 13 05 10 00    	mov    $0x100513,%ecx
  100fd1:	52                   	push   %edx
  100fd2:	50                   	push   %eax
  100fd3:	51                   	push   %ecx
  100fd4:	6a 22                	push   $0x22
  100fd6:	e8 32 f9 ff ff       	call   10090d <setGateDescriptor>
  100fdb:	83 c4 10             	add    $0x10,%esp
  100fde:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  100fe2:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100fe6:	c7 c1 20 05 10 00    	mov    $0x100520,%ecx
  100fec:	52                   	push   %edx
  100fed:	50                   	push   %eax
  100fee:	51                   	push   %ecx
  100fef:	6a 23                	push   $0x23
  100ff1:	e8 17 f9 ff ff       	call   10090d <setGateDescriptor>
  100ff6:	83 c4 10             	add    $0x10,%esp
  100ff9:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  100ffd:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101001:	c7 c1 2d 05 10 00    	mov    $0x10052d,%ecx
  101007:	52                   	push   %edx
  101008:	50                   	push   %eax
  101009:	51                   	push   %ecx
  10100a:	6a 24                	push   $0x24
  10100c:	e8 fc f8 ff ff       	call   10090d <setGateDescriptor>
  101011:	83 c4 10             	add    $0x10,%esp
  101014:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  101018:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  10101c:	c7 c1 3a 05 10 00    	mov    $0x10053a,%ecx
  101022:	52                   	push   %edx
  101023:	50                   	push   %eax
  101024:	51                   	push   %ecx
  101025:	6a 25                	push   $0x25
  101027:	e8 e1 f8 ff ff       	call   10090d <setGateDescriptor>
  10102c:	83 c4 10             	add    $0x10,%esp
  10102f:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  101033:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101037:	c7 c1 47 05 10 00    	mov    $0x100547,%ecx
  10103d:	52                   	push   %edx
  10103e:	50                   	push   %eax
  10103f:	51                   	push   %ecx
  101040:	6a 26                	push   $0x26
  101042:	e8 c6 f8 ff ff       	call   10090d <setGateDescriptor>
  101047:	83 c4 10             	add    $0x10,%esp
  10104a:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  10104e:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101052:	c7 c1 54 05 10 00    	mov    $0x100554,%ecx
  101058:	52                   	push   %edx
  101059:	50                   	push   %eax
  10105a:	51                   	push   %ecx
  10105b:	6a 27                	push   $0x27
  10105d:	e8 ab f8 ff ff       	call   10090d <setGateDescriptor>
  101062:	83 c4 10             	add    $0x10,%esp
  101065:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  101069:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  10106d:	c7 c1 61 05 10 00    	mov    $0x100561,%ecx
  101073:	52                   	push   %edx
  101074:	50                   	push   %eax
  101075:	51                   	push   %ecx
  101076:	6a 28                	push   $0x28
  101078:	e8 90 f8 ff ff       	call   10090d <setGateDescriptor>
  10107d:	83 c4 10             	add    $0x10,%esp
  101080:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  101084:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101088:	c7 c1 6e 05 10 00    	mov    $0x10056e,%ecx
  10108e:	52                   	push   %edx
  10108f:	50                   	push   %eax
  101090:	51                   	push   %ecx
  101091:	6a 29                	push   $0x29
  101093:	e8 75 f8 ff ff       	call   10090d <setGateDescriptor>
  101098:	83 c4 10             	add    $0x10,%esp
  10109b:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  10109f:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  1010a3:	c7 c1 7b 05 10 00    	mov    $0x10057b,%ecx
  1010a9:	52                   	push   %edx
  1010aa:	50                   	push   %eax
  1010ab:	51                   	push   %ecx
  1010ac:	6a 2a                	push   $0x2a
  1010ae:	e8 5a f8 ff ff       	call   10090d <setGateDescriptor>
  1010b3:	83 c4 10             	add    $0x10,%esp
  1010b6:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  1010ba:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  1010be:	c7 c1 88 05 10 00    	mov    $0x100588,%ecx
  1010c4:	52                   	push   %edx
  1010c5:	50                   	push   %eax
  1010c6:	51                   	push   %ecx
  1010c7:	6a 2b                	push   $0x2b
  1010c9:	e8 3f f8 ff ff       	call   10090d <setGateDescriptor>
  1010ce:	83 c4 10             	add    $0x10,%esp
  1010d1:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  1010d5:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  1010d9:	c7 c1 95 05 10 00    	mov    $0x100595,%ecx
  1010df:	52                   	push   %edx
  1010e0:	50                   	push   %eax
  1010e1:	51                   	push   %ecx
  1010e2:	6a 2c                	push   $0x2c
  1010e4:	e8 24 f8 ff ff       	call   10090d <setGateDescriptor>
  1010e9:	83 c4 10             	add    $0x10,%esp
  1010ec:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  1010f0:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  1010f4:	c7 c1 a2 05 10 00    	mov    $0x1005a2,%ecx
  1010fa:	52                   	push   %edx
  1010fb:	50                   	push   %eax
  1010fc:	51                   	push   %ecx
  1010fd:	6a 2d                	push   $0x2d
  1010ff:	e8 09 f8 ff ff       	call   10090d <setGateDescriptor>
  101104:	83 c4 10             	add    $0x10,%esp
  101107:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  10110b:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  10110f:	c7 c1 af 05 10 00    	mov    $0x1005af,%ecx
  101115:	52                   	push   %edx
  101116:	50                   	push   %eax
  101117:	51                   	push   %ecx
  101118:	6a 2e                	push   $0x2e
  10111a:	e8 ee f7 ff ff       	call   10090d <setGateDescriptor>
  10111f:	83 c4 10             	add    $0x10,%esp
  101122:	0f b6 55 dc          	movzbl -0x24(%ebp),%edx
  101126:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  10112a:	c7 c1 bc 05 10 00    	mov    $0x1005bc,%ecx
  101130:	52                   	push   %edx
  101131:	50                   	push   %eax
  101132:	51                   	push   %ecx
  101133:	6a 2f                	push   $0x2f
  101135:	e8 d3 f7 ff ff       	call   10090d <setGateDescriptor>
  10113a:	83 c4 10             	add    $0x10,%esp
  10113d:	e8 26 f9 ff ff       	call   100a68 <loadIDT>
  101142:	90                   	nop
  101143:	8d 65 f8             	lea    -0x8(%ebp),%esp
  101146:	5b                   	pop    %ebx
  101147:	5e                   	pop    %esi
  101148:	5d                   	pop    %ebp
  101149:	c3                   	ret    

0010114a <enableInterrupts>:
  10114a:	55                   	push   %ebp
  10114b:	89 e5                	mov    %esp,%ebp
  10114d:	e8 fe f1 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  101152:	05 12 0a 00 00       	add    $0xa12,%eax
  101157:	fb                   	sti    
  101158:	90                   	nop
  101159:	5d                   	pop    %ebp
  10115a:	c3                   	ret    

0010115b <disableInterrupts>:
  10115b:	55                   	push   %ebp
  10115c:	89 e5                	mov    %esp,%ebp
  10115e:	e8 ed f1 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  101163:	05 01 0a 00 00       	add    $0xa01,%eax
  101168:	fa                   	cli    
  101169:	90                   	nop
  10116a:	5d                   	pop    %ebp
  10116b:	c3                   	ret    

0010116c <resetPIC>:
  10116c:	55                   	push   %ebp
  10116d:	89 e5                	mov    %esp,%ebp
  10116f:	53                   	push   %ebx
  101170:	83 ec 24             	sub    $0x24,%esp
  101173:	e8 dc f1 ff ff       	call   100354 <__x86.get_pc_thunk.bx>
  101178:	81 c3 ec 09 00 00    	add    $0x9ec,%ebx
  10117e:	8b 45 08             	mov    0x8(%ebp),%eax
  101181:	88 45 e4             	mov    %al,-0x1c(%ebp)
  101184:	83 ec 0c             	sub    $0xc,%esp
  101187:	6a 21                	push   $0x21
  101189:	e8 d4 f9 ff ff       	call   100b62 <inb>
  10118e:	83 c4 10             	add    $0x10,%esp
  101191:	88 45 f7             	mov    %al,-0x9(%ebp)
  101194:	83 ec 0c             	sub    $0xc,%esp
  101197:	68 a1 00 00 00       	push   $0xa1
  10119c:	e8 c1 f9 ff ff       	call   100b62 <inb>
  1011a1:	83 c4 10             	add    $0x10,%esp
  1011a4:	88 45 f6             	mov    %al,-0xa(%ebp)
  1011a7:	83 ec 08             	sub    $0x8,%esp
  1011aa:	6a 11                	push   $0x11
  1011ac:	6a 20                	push   $0x20
  1011ae:	e8 dd f9 ff ff       	call   100b90 <outb>
  1011b3:	83 c4 10             	add    $0x10,%esp
  1011b6:	83 ec 08             	sub    $0x8,%esp
  1011b9:	6a 11                	push   $0x11
  1011bb:	68 a0 00 00 00       	push   $0xa0
  1011c0:	e8 cb f9 ff ff       	call   100b90 <outb>
  1011c5:	83 c4 10             	add    $0x10,%esp
  1011c8:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  1011cc:	83 ec 08             	sub    $0x8,%esp
  1011cf:	50                   	push   %eax
  1011d0:	6a 21                	push   $0x21
  1011d2:	e8 b9 f9 ff ff       	call   100b90 <outb>
  1011d7:	83 c4 10             	add    $0x10,%esp
  1011da:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  1011de:	83 c0 08             	add    $0x8,%eax
  1011e1:	0f b6 c0             	movzbl %al,%eax
  1011e4:	83 ec 08             	sub    $0x8,%esp
  1011e7:	50                   	push   %eax
  1011e8:	68 a1 00 00 00       	push   $0xa1
  1011ed:	e8 9e f9 ff ff       	call   100b90 <outb>
  1011f2:	83 c4 10             	add    $0x10,%esp
  1011f5:	83 ec 08             	sub    $0x8,%esp
  1011f8:	6a 04                	push   $0x4
  1011fa:	6a 21                	push   $0x21
  1011fc:	e8 8f f9 ff ff       	call   100b90 <outb>
  101201:	83 c4 10             	add    $0x10,%esp
  101204:	83 ec 08             	sub    $0x8,%esp
  101207:	6a 02                	push   $0x2
  101209:	68 a1 00 00 00       	push   $0xa1
  10120e:	e8 7d f9 ff ff       	call   100b90 <outb>
  101213:	83 c4 10             	add    $0x10,%esp
  101216:	83 ec 08             	sub    $0x8,%esp
  101219:	6a 01                	push   $0x1
  10121b:	6a 21                	push   $0x21
  10121d:	e8 6e f9 ff ff       	call   100b90 <outb>
  101222:	83 c4 10             	add    $0x10,%esp
  101225:	83 ec 08             	sub    $0x8,%esp
  101228:	6a 01                	push   $0x1
  10122a:	68 a1 00 00 00       	push   $0xa1
  10122f:	e8 5c f9 ff ff       	call   100b90 <outb>
  101234:	83 c4 10             	add    $0x10,%esp
  101237:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10123b:	83 ec 08             	sub    $0x8,%esp
  10123e:	50                   	push   %eax
  10123f:	6a 21                	push   $0x21
  101241:	e8 4a f9 ff ff       	call   100b90 <outb>
  101246:	83 c4 10             	add    $0x10,%esp
  101249:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  10124d:	83 ec 08             	sub    $0x8,%esp
  101250:	50                   	push   %eax
  101251:	68 a1 00 00 00       	push   $0xa1
  101256:	e8 35 f9 ff ff       	call   100b90 <outb>
  10125b:	83 c4 10             	add    $0x10,%esp
  10125e:	90                   	nop
  10125f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101262:	c9                   	leave  
  101263:	c3                   	ret    

00101264 <setPICMask>:
  101264:	55                   	push   %ebp
  101265:	89 e5                	mov    %esp,%ebp
  101267:	53                   	push   %ebx
  101268:	83 ec 14             	sub    $0x14,%esp
  10126b:	e8 e4 f0 ff ff       	call   100354 <__x86.get_pc_thunk.bx>
  101270:	81 c3 f4 08 00 00    	add    $0x8f4,%ebx
  101276:	8b 45 08             	mov    0x8(%ebp),%eax
  101279:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  10127d:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  101281:	0f b6 c0             	movzbl %al,%eax
  101284:	83 ec 08             	sub    $0x8,%esp
  101287:	50                   	push   %eax
  101288:	6a 21                	push   $0x21
  10128a:	e8 01 f9 ff ff       	call   100b90 <outb>
  10128f:	83 c4 10             	add    $0x10,%esp
  101292:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  101296:	66 c1 e8 08          	shr    $0x8,%ax
  10129a:	0f b6 c0             	movzbl %al,%eax
  10129d:	83 ec 08             	sub    $0x8,%esp
  1012a0:	50                   	push   %eax
  1012a1:	68 a1 00 00 00       	push   $0xa1
  1012a6:	e8 e5 f8 ff ff       	call   100b90 <outb>
  1012ab:	83 c4 10             	add    $0x10,%esp
  1012ae:	90                   	nop
  1012af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012b2:	c9                   	leave  
  1012b3:	c3                   	ret    

001012b4 <resetPICMask>:
  1012b4:	55                   	push   %ebp
  1012b5:	89 e5                	mov    %esp,%ebp
  1012b7:	53                   	push   %ebx
  1012b8:	83 ec 04             	sub    $0x4,%esp
  1012bb:	e8 94 f0 ff ff       	call   100354 <__x86.get_pc_thunk.bx>
  1012c0:	81 c3 a4 08 00 00    	add    $0x8a4,%ebx
  1012c6:	83 ec 08             	sub    $0x8,%esp
  1012c9:	6a 00                	push   $0x0
  1012cb:	6a 21                	push   $0x21
  1012cd:	e8 be f8 ff ff       	call   100b90 <outb>
  1012d2:	83 c4 10             	add    $0x10,%esp
  1012d5:	83 ec 08             	sub    $0x8,%esp
  1012d8:	6a 00                	push   $0x0
  1012da:	68 a1 00 00 00       	push   $0xa1
  1012df:	e8 ac f8 ff ff       	call   100b90 <outb>
  1012e4:	83 c4 10             	add    $0x10,%esp
  1012e7:	90                   	nop
  1012e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012eb:	c9                   	leave  
  1012ec:	c3                   	ret    

001012ed <getPICMask>:
  1012ed:	55                   	push   %ebp
  1012ee:	89 e5                	mov    %esp,%ebp
  1012f0:	56                   	push   %esi
  1012f1:	53                   	push   %ebx
  1012f2:	e8 5d f0 ff ff       	call   100354 <__x86.get_pc_thunk.bx>
  1012f7:	81 c3 6d 08 00 00    	add    $0x86d,%ebx
  1012fd:	83 ec 0c             	sub    $0xc,%esp
  101300:	6a 21                	push   $0x21
  101302:	e8 5b f8 ff ff       	call   100b62 <inb>
  101307:	83 c4 10             	add    $0x10,%esp
  10130a:	0f b6 f0             	movzbl %al,%esi
  10130d:	83 ec 0c             	sub    $0xc,%esp
  101310:	68 a1 00 00 00       	push   $0xa1
  101315:	e8 48 f8 ff ff       	call   100b62 <inb>
  10131a:	83 c4 10             	add    $0x10,%esp
  10131d:	0f b6 c0             	movzbl %al,%eax
  101320:	c1 e0 08             	shl    $0x8,%eax
  101323:	09 f0                	or     %esi,%eax
  101325:	8d 65 f8             	lea    -0x8(%ebp),%esp
  101328:	5b                   	pop    %ebx
  101329:	5e                   	pop    %esi
  10132a:	5d                   	pop    %ebp
  10132b:	c3                   	ret    

0010132c <sendEOIMasterPIC>:
  10132c:	55                   	push   %ebp
  10132d:	89 e5                	mov    %esp,%ebp
  10132f:	53                   	push   %ebx
  101330:	83 ec 04             	sub    $0x4,%esp
  101333:	e8 18 f0 ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  101338:	05 2c 08 00 00       	add    $0x82c,%eax
  10133d:	83 ec 08             	sub    $0x8,%esp
  101340:	6a 20                	push   $0x20
  101342:	6a 20                	push   $0x20
  101344:	89 c3                	mov    %eax,%ebx
  101346:	e8 45 f8 ff ff       	call   100b90 <outb>
  10134b:	83 c4 10             	add    $0x10,%esp
  10134e:	90                   	nop
  10134f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101352:	c9                   	leave  
  101353:	c3                   	ret    

00101354 <sendEOISlavePIC>:
  101354:	55                   	push   %ebp
  101355:	89 e5                	mov    %esp,%ebp
  101357:	53                   	push   %ebx
  101358:	83 ec 04             	sub    $0x4,%esp
  10135b:	e8 f0 ef ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  101360:	05 04 08 00 00       	add    $0x804,%eax
  101365:	83 ec 08             	sub    $0x8,%esp
  101368:	6a 20                	push   $0x20
  10136a:	68 a0 00 00 00       	push   $0xa0
  10136f:	89 c3                	mov    %eax,%ebx
  101371:	e8 1a f8 ff ff       	call   100b90 <outb>
  101376:	83 c4 10             	add    $0x10,%esp
  101379:	90                   	nop
  10137a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10137d:	c9                   	leave  
  10137e:	c3                   	ret    

0010137f <handleIRQ>:
  10137f:	55                   	push   %ebp
  101380:	89 e5                	mov    %esp,%ebp
  101382:	53                   	push   %ebx
  101383:	83 ec 14             	sub    $0x14,%esp
  101386:	e8 c9 ef ff ff       	call   100354 <__x86.get_pc_thunk.bx>
  10138b:	81 c3 d9 07 00 00    	add    $0x7d9,%ebx
  101391:	8b 45 08             	mov    0x8(%ebp),%eax
  101394:	88 45 f4             	mov    %al,-0xc(%ebp)
  101397:	83 ec 0c             	sub    $0xc,%esp
  10139a:	8d 83 4e fa ff ff    	lea    -0x5b2(%ebx),%eax
  1013a0:	50                   	push   %eax
  1013a1:	e8 d8 ec ff ff       	call   10007e <printf>
  1013a6:	83 c4 10             	add    $0x10,%esp
  1013a9:	83 ec 08             	sub    $0x8,%esp
  1013ac:	6a 01                	push   $0x1
  1013ae:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1013b1:	50                   	push   %eax
  1013b2:	e8 4b ed ff ff       	call   100102 <hexDump>
  1013b7:	83 c4 10             	add    $0x10,%esp
  1013ba:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
  1013be:	3c 1f                	cmp    $0x1f,%al
  1013c0:	76 0f                	jbe    1013d1 <handleIRQ+0x52>
  1013c2:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
  1013c6:	3c 27                	cmp    $0x27,%al
  1013c8:	77 07                	ja     1013d1 <handleIRQ+0x52>
  1013ca:	e8 5d ff ff ff       	call   10132c <sendEOIMasterPIC>
  1013cf:	eb 1a                	jmp    1013eb <handleIRQ+0x6c>
  1013d1:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
  1013d5:	3c 27                	cmp    $0x27,%al
  1013d7:	76 12                	jbe    1013eb <handleIRQ+0x6c>
  1013d9:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
  1013dd:	3c 2f                	cmp    $0x2f,%al
  1013df:	77 0a                	ja     1013eb <handleIRQ+0x6c>
  1013e1:	e8 6e ff ff ff       	call   101354 <sendEOISlavePIC>
  1013e6:	e8 41 ff ff ff       	call   10132c <sendEOIMasterPIC>
  1013eb:	90                   	nop
  1013ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1013ef:	c9                   	leave  
  1013f0:	c3                   	ret    

001013f1 <handleException>:
  1013f1:	55                   	push   %ebp
  1013f2:	89 e5                	mov    %esp,%ebp
  1013f4:	53                   	push   %ebx
  1013f5:	83 ec 14             	sub    $0x14,%esp
  1013f8:	e8 57 ef ff ff       	call   100354 <__x86.get_pc_thunk.bx>
  1013fd:	81 c3 67 07 00 00    	add    $0x767,%ebx
  101403:	8b 45 08             	mov    0x8(%ebp),%eax
  101406:	88 45 f4             	mov    %al,-0xc(%ebp)
  101409:	e8 fe eb ff ff       	call   10000c <clearScreen>
  10140e:	83 ec 0c             	sub    $0xc,%esp
  101411:	8d 83 5a fa ff ff    	lea    -0x5a6(%ebx),%eax
  101417:	50                   	push   %eax
  101418:	e8 61 ec ff ff       	call   10007e <printf>
  10141d:	83 c4 10             	add    $0x10,%esp
  101420:	83 ec 08             	sub    $0x8,%esp
  101423:	6a 01                	push   $0x1
  101425:	8d 45 f4             	lea    -0xc(%ebp),%eax
  101428:	50                   	push   %eax
  101429:	e8 d4 ec ff ff       	call   100102 <hexDump>
  10142e:	83 c4 10             	add    $0x10,%esp
  101431:	e8 67 ed ff ff       	call   10019d <printRegisters>
  101436:	83 ec 0c             	sub    $0xc,%esp
  101439:	8d 83 65 fa ff ff    	lea    -0x59b(%ebx),%eax
  10143f:	50                   	push   %eax
  101440:	e8 39 ec ff ff       	call   10007e <printf>
  101445:	83 c4 10             	add    $0x10,%esp
  101448:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10144b:	83 e8 10             	sub    $0x10,%eax
  10144e:	83 ec 08             	sub    $0x8,%esp
  101451:	6a 18                	push   $0x18
  101453:	50                   	push   %eax
  101454:	e8 a9 ec ff ff       	call   100102 <hexDump>
  101459:	83 c4 10             	add    $0x10,%esp
  10145c:	eb fe                	jmp    10145c <handleException+0x6b>

0010145e <setUpGDT>:
  10145e:	55                   	push   %ebp
  10145f:	89 e5                	mov    %esp,%ebp
  101461:	53                   	push   %ebx
  101462:	83 ec 04             	sub    $0x4,%esp
  101465:	e8 ea ee ff ff       	call   100354 <__x86.get_pc_thunk.bx>
  10146a:	81 c3 fa 06 00 00    	add    $0x6fa,%ebx
  101470:	83 ec 0c             	sub    $0xc,%esp
  101473:	6a 00                	push   $0x0
  101475:	6a 00                	push   $0x0
  101477:	6a 00                	push   $0x0
  101479:	6a 00                	push   $0x0
  10147b:	6a 00                	push   $0x0
  10147d:	e8 58 f1 ff ff       	call   1005da <setSegmentDescriptor>
  101482:	83 c4 20             	add    $0x20,%esp
  101485:	83 ec 0c             	sub    $0xc,%esp
  101488:	6a 0c                	push   $0xc
  10148a:	68 9a 00 00 00       	push   $0x9a
  10148f:	6a ff                	push   $0xffffffff
  101491:	6a 00                	push   $0x0
  101493:	6a 01                	push   $0x1
  101495:	e8 40 f1 ff ff       	call   1005da <setSegmentDescriptor>
  10149a:	83 c4 20             	add    $0x20,%esp
  10149d:	83 ec 0c             	sub    $0xc,%esp
  1014a0:	6a 0c                	push   $0xc
  1014a2:	68 92 00 00 00       	push   $0x92
  1014a7:	6a ff                	push   $0xffffffff
  1014a9:	6a 00                	push   $0x0
  1014ab:	6a 02                	push   $0x2
  1014ad:	e8 28 f1 ff ff       	call   1005da <setSegmentDescriptor>
  1014b2:	83 c4 20             	add    $0x20,%esp
  1014b5:	83 ec 0c             	sub    $0xc,%esp
  1014b8:	6a 03                	push   $0x3
  1014ba:	e8 07 f4 ff ff       	call   1008c6 <loadGDT>
  1014bf:	83 c4 10             	add    $0x10,%esp
  1014c2:	90                   	nop
  1014c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1014c6:	c9                   	leave  
  1014c7:	c3                   	ret    

001014c8 <setUpInterrupts>:
  1014c8:	55                   	push   %ebp
  1014c9:	89 e5                	mov    %esp,%ebp
  1014cb:	53                   	push   %ebx
  1014cc:	83 ec 04             	sub    $0x4,%esp
  1014cf:	e8 80 ee ff ff       	call   100354 <__x86.get_pc_thunk.bx>
  1014d4:	81 c3 90 06 00 00    	add    $0x690,%ebx
  1014da:	83 ec 0c             	sub    $0xc,%esp
  1014dd:	6a 01                	push   $0x1
  1014df:	e8 80 fd ff ff       	call   101264 <setPICMask>
  1014e4:	83 c4 10             	add    $0x10,%esp
  1014e7:	83 ec 0c             	sub    $0xc,%esp
  1014ea:	6a 20                	push   $0x20
  1014ec:	e8 7b fc ff ff       	call   10116c <resetPIC>
  1014f1:	83 c4 10             	add    $0x10,%esp
  1014f4:	83 ec 04             	sub    $0x4,%esp
  1014f7:	68 8e 00 00 00       	push   $0x8e
  1014fc:	68 8f 00 00 00       	push   $0x8f
  101501:	6a 08                	push   $0x8
  101503:	e8 bd f6 ff ff       	call   100bc5 <initializeIDT>
  101508:	83 c4 10             	add    $0x10,%esp
  10150b:	e8 3a fc ff ff       	call   10114a <enableInterrupts>
  101510:	90                   	nop
  101511:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101514:	c9                   	leave  
  101515:	c3                   	ret    

00101516 <kernelMain>:
  101516:	55                   	push   %ebp
  101517:	89 e5                	mov    %esp,%ebp
  101519:	53                   	push   %ebx
  10151a:	83 ec 04             	sub    $0x4,%esp
  10151d:	e8 2e ee ff ff       	call   100350 <__x86.get_pc_thunk.ax>
  101522:	05 42 06 00 00       	add    $0x642,%eax
  101527:	89 c3                	mov    %eax,%ebx
  101529:	e8 de ea ff ff       	call   10000c <clearScreen>
  10152e:	e8 2b ff ff ff       	call   10145e <setUpGDT>
  101533:	e8 90 ff ff ff       	call   1014c8 <setUpInterrupts>
  101538:	eb fe                	jmp    101538 <kernelMain+0x22>
  10153a:	20 20                	and    %ah,(%eax)
  10153c:	20 20                	and    %ah,(%eax)
  10153e:	20 20                	and    %ah,(%eax)
  101540:	20 20                	and    %ah,(%eax)
  101542:	20 20                	and    %ah,(%eax)
  101544:	20 20                	and    %ah,(%eax)
  101546:	20 20                	and    %ah,(%eax)
  101548:	20 20                	and    %ah,(%eax)
  10154a:	20 20                	and    %ah,(%eax)
  10154c:	20 20                	and    %ah,(%eax)
  10154e:	20 20                	and    %ah,(%eax)
  101550:	20 20                	and    %ah,(%eax)
  101552:	20 00                	and    %al,(%eax)
  101554:	20 00                	and    %al,(%eax)
  101556:	20 20                	and    %ah,(%eax)
  101558:	20 45 41             	and    %al,0x41(%ebp)
  10155b:	58                   	pop    %eax
  10155c:	3a 00                	cmp    (%eax),%al
  10155e:	20 20                	and    %ah,(%eax)
  101560:	20 45 42             	and    %al,0x42(%ebp)
  101563:	58                   	pop    %eax
  101564:	3a 00                	cmp    (%eax),%al
  101566:	20 20                	and    %ah,(%eax)
  101568:	20 45 43             	and    %al,0x43(%ebp)
  10156b:	58                   	pop    %eax
  10156c:	3a 00                	cmp    (%eax),%al
  10156e:	20 20                	and    %ah,(%eax)
  101570:	20 45 44             	and    %al,0x44(%ebp)
  101573:	58                   	pop    %eax
  101574:	3a 00                	cmp    (%eax),%al
  101576:	20 20                	and    %ah,(%eax)
  101578:	20 45 53             	and    %al,0x53(%ebp)
  10157b:	49                   	dec    %ecx
  10157c:	3a 00                	cmp    (%eax),%al
  10157e:	20 20                	and    %ah,(%eax)
  101580:	20 45 44             	and    %al,0x44(%ebp)
  101583:	49                   	dec    %ecx
  101584:	3a 00                	cmp    (%eax),%al
  101586:	20 20                	and    %ah,(%eax)
  101588:	20 45 42             	and    %al,0x42(%ebp)
  10158b:	50                   	push   %eax
  10158c:	3a 00                	cmp    (%eax),%al
  10158e:	20 20                	and    %ah,(%eax)
  101590:	20 45 53             	and    %al,0x53(%ebp)
  101593:	50                   	push   %eax
  101594:	3a 00                	cmp    (%eax),%al
  101596:	20 20                	and    %ah,(%eax)
  101598:	20 43 53             	and    %al,0x53(%ebx)
  10159b:	3a 00                	cmp    (%eax),%al
  10159d:	20 20                	and    %ah,(%eax)
  10159f:	20 44 53 3a          	and    %al,0x3a(%ebx,%edx,2)
  1015a3:	00 20                	add    %ah,(%eax)
  1015a5:	20 20                	and    %ah,(%eax)
  1015a7:	53                   	push   %ebx
  1015a8:	53                   	push   %ebx
  1015a9:	3a 00                	cmp    (%eax),%al
  1015ab:	20 20                	and    %ah,(%eax)
  1015ad:	20 45 53             	and    %al,0x53(%ebp)
  1015b0:	3a 00                	cmp    (%eax),%al
  1015b2:	20 49 4e             	and    %cl,0x4e(%ecx)
  1015b5:	54                   	push   %esp
  1015b6:	45                   	inc    %ebp
  1015b7:	52                   	push   %edx
  1015b8:	52                   	push   %edx
  1015b9:	55                   	push   %ebp
  1015ba:	50                   	push   %eax
  1015bb:	54                   	push   %esp
  1015bc:	3a 00                	cmp    (%eax),%al
  1015be:	45                   	inc    %ebp
  1015bf:	58                   	pop    %eax
  1015c0:	43                   	inc    %ebx
  1015c1:	45                   	inc    %ebp
  1015c2:	50                   	push   %eax
  1015c3:	54                   	push   %esp
  1015c4:	49                   	dec    %ecx
  1015c5:	4f                   	dec    %edi
  1015c6:	4e                   	dec    %esi
  1015c7:	20 00                	and    %al,(%eax)
  1015c9:	20 20                	and    %ah,(%eax)
  1015cb:	20 20                	and    %ah,(%eax)
  1015cd:	20 20                	and    %ah,(%eax)
  1015cf:	20 20                	and    %ah,(%eax)
  1015d1:	20 20                	and    %ah,(%eax)
  1015d3:	53                   	push   %ebx
  1015d4:	54                   	push   %esp
  1015d5:	41                   	inc    %ecx
  1015d6:	43                   	inc    %ebx
  1015d7:	4b                   	dec    %ebx
  1015d8:	3a 20                	cmp    (%eax),%ah
	...
