Project: 4096-bit RSA Implementation and Side-Channel Attacks' Countermeasures on FPGA
By Qin Zhou (fatestudio@gmail.com), UC Santa Barbara

Target device is Cyclone II EP2C50F484C6, Platform is Quartus II 12.1 sp1 64-bit web edition, simulated with ModelSim Altera starter edition 10.1b. 
Language is Verilog HDL 2001.

Folders:
    ModExp: Basic version of RSA4096. Word length is 128-bit. 32 words per number. Tested with 4 cases generated in the Mathematica script file below (RSA4096.nb).
    
    ModExp64: Same structure as ModExp128 but word length is 64-bit. 64 words per number. 
    
    ModExp32: Same structure as ModExp128 but word length is 32-bit. 128 words per number.
    
    ModExpPoweringLadder: Based on ModExp 128-bit with powering ladder countermeasure.
    
    ModExpBlinding: Based on ModExp 128-bit with blinding countermeasure.

    MonPro: Individual MonPro module,   128-bit word length.
    
    Scripts:
        RSA4096.nb: Generate n, m, e, etc, make some correct cases
        RSA4096.py: Code for generating files needed for FPGA simulation and more

    Docs:
        ms project.pptx & pdf: general background of this project and some results. Reference in this document is helpful.
        
        ModExp4096.pdf: slides that explain the RSA4096 design in details. 
        ICD 2.0.docx: Interface control document of old design
    
        joye1.pdf & joye2.pdf: general background of countermeasures.
        
