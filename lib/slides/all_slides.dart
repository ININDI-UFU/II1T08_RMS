import 'package:flutter/material.dart';
import '../widgets/slide_template.dart';

Widget buildSlide(int index) {
  switch (index) {
    case 0:
      return const TitleSlide(
        key: ValueKey(0),
        title: 'Cálculo RMS na ESP32',
        subtitle:
            'Root Mean Square — Medição de Sinais AC\n\nOtimizações com aritmética inteira e ponto fixo\nAula 14 • Sistemas Embarcados',
        chip: 'CÁLCULO RMS',
        accentColor: Color(0xFF00E5FF),
      );
    case 1:
      return CardsSlide(
        key: const ValueKey(1),
        title: 'Agenda',
        subtitle: 'Conteúdo da aula',
        accentColor: const Color(0xFF00E5FF),
        cards: const [
          InfoCardData(
            title: '01. Fundamentos',
            description: 'O que é RMS e por que é importante',
            icon: Icons.school_rounded,
            color: Color(0xFF00E5FF),
          ),
          InfoCardData(
            title: '02. Matemática',
            description: 'Fórmula RMS: √(Σx²/N)',
            icon: Icons.calculate_rounded,
            color: Color(0xFF7C4DFF),
          ),
          InfoCardData(
            title: '03. ADC na ESP32',
            description: 'Leitura analógica e resolução',
            icon: Icons.memory_rounded,
            color: Color(0xFF00E5FF),
          ),
          InfoCardData(
            title: '04. Implementação',
            description: 'Código básico e variantes',
            icon: Icons.code_rounded,
            color: Color(0xFF7C4DFF),
          ),
          InfoCardData(
            title: '05. Otimizações',
            description: 'Ponto fixo, inteiro, performance',
            icon: Icons.speed_rounded,
            color: Color(0xFF00E5FF),
          ),
          InfoCardData(
            title: '06. Aplicações',
            description: 'Voltímetro AC, potência, qualidade',
            icon: Icons.devices_rounded,
            color: Color(0xFF7C4DFF),
          ),
        ],
        crossAxisCount: 3,
      );
    case 2:
      return ContentSlide(
        key: const ValueKey(2),
        title: 'O que é RMS?',
        subtitle: 'Root Mean Square — Valor eficaz de um sinal',
        accentColor: const Color(0xFF00E5FF),
        items: const [
          ContentItem(
            text: 'RMS é o valor equivalente DC que produz a mesma potência',
            icon: Icons.electrical_services_rounded,
            iconColor: Color(0xFF00E5FF),
            isBold: true,
          ),
          ContentItem(
            text: 'Para senoide: Vrms = Vpico / √2 ≈ 0.707 × Vpico',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF7C4DFF),
          ),
          ContentItem(
            text: 'Rede elétrica: 127V RMS = 179.6V pico',
            icon: Icons.bolt_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Para sinais não-senoidais (PWM, triangular), média ≠ RMS',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text:
                'Multímetros True RMS medem o valor real para qualquer forma de onda',
            icon: Icons.straighten_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text:
                'Aplicações: medição de potência, proteção, controle de qualidade',
            icon: Icons.devices_rounded,
          ),
        ],
      );
    case 3:
      return ContentSlide(
        key: const ValueKey(3),
        title: 'Fórmula RMS — Discretizada',
        subtitle: 'Adaptação para processamento digital',
        accentColor: const Color(0xFF7C4DFF),
        items: const [
          ContentItem(
            text: 'Contínuo: Vrms = √( (1/T) ∫₀ᵀ v²(t) dt )',
            icon: Icons.functions_rounded,
            iconColor: Color(0xFF7C4DFF),
            isBold: true,
          ),
          ContentItem(
            text: 'Discreto: Vrms = √( (1/N) Σᵢ₌₁ᴺ xᵢ² )',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF00E5FF),
            isBold: true,
          ),
          ContentItem(
            text: 'Passo 1: Elevar cada amostra ao quadrado (x²)',
            icon: Icons.looks_one_rounded,
            iconColor: Color(0xFF00E5FF),
          ),
          ContentItem(
            text: 'Passo 2: Somar todos os quadrados (Σx²)',
            icon: Icons.looks_two_rounded,
            iconColor: Color(0xFF00E5FF),
          ),
          ContentItem(
            text: 'Passo 3: Dividir pela quantidade N (média)',
            icon: Icons.looks_3_rounded,
            iconColor: Color(0xFF00E5FF),
          ),
          ContentItem(
            text: 'Passo 4: Raiz quadrada (√) — resultado final',
            icon: Icons.looks_4_rounded,
            iconColor: Color(0xFF00E5FF),
          ),
          ContentItem(
            text: 'N deve cobrir pelo menos 1 ciclo completo do sinal',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
        ],
      );
    case 4:
      return const SectionTitleSlide(
        key: ValueKey(4),
        sectionNumber: '01',
        title: 'ADC na ESP32',
        subtitle:
            'Leitura analógica e configuração\n12 bits • SAR • 2 unidades ADC',
        accentColor: Color(0xFF00E5FF),
        icon: Icons.memory_rounded,
      );
    case 5:
      return ContentSlide(
        key: const ValueKey(5),
        title: 'ADC — Características',
        subtitle: 'SAR ADC de 12 bits',
        accentColor: const Color(0xFF00E5FF),
        items: const [
          ContentItem(
            text: '12 bits: 4096 níveis (0–4095) para 0–3.3V',
            icon: Icons.linear_scale_rounded,
            iconColor: Color(0xFF00E5FF),
            isBold: true,
          ),
          ContentItem(
            text: 'ADC1: 8 canais (GPIO 32-39) — uso livre',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text:
                'ADC2: 10 canais (GPIO 0,2,4,12-15,25-27) — conflita com WiFi!',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text: 'Velocidade: até ~20 ksps (com analogRead padrão)',
            icon: Icons.speed_rounded,
          ),
          ContentItem(
            text: 'Não-linearidade: ±10 LSB típico (pior nas extremidades)',
            icon: Icons.show_chart_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Atenuação configurável: 0dB, 2.5dB, 6dB, 11dB',
            icon: Icons.tune_rounded,
            iconColor: Color(0xFF7C4DFF),
          ),
          ContentItem(
            text:
                '11dB: faixa 0–3.3V (padrão), 0dB: faixa 0–1.1V (mais preciso)',
            icon: Icons.info_rounded,
          ),
        ],
      );
    case 6:
      return ContentSlide(
        key: const ValueKey(6),
        title: 'Condicionamento de Sinal',
        subtitle: 'Preparando o sinal AC para o ADC',
        accentColor: const Color(0xFF00E5FF),
        items: const [
          ContentItem(
            text: 'ADC ESP32 só lê 0 a 3.3V — sinais AC precisam de offset DC',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
            isBold: true,
          ),
          ContentItem(
            text: 'Divisor resistivo: R1=R2 → Voffset = VCC/2 = 1.65V',
            icon: Icons.settings_input_component_rounded,
            iconColor: Color(0xFF00E5FF),
          ),
          ContentItem(
            text: 'Sinal AC oscila em torno do offset (1.65V ± amplitude)',
            icon: Icons.waves_rounded,
            iconColor: Color(0xFF7C4DFF),
          ),
          ContentItem(
            text:
                'Capacitor de acoplamento: bloqueia DC do sinal, passa apenas AC',
            icon: Icons.filter_alt_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Amplitude máxima: ±1.65V (total 3.3V de excursão)',
            icon: Icons.height_rounded,
          ),
          ContentItem(
            text: 'Para sinais maiores: usar divisor de tensão adicional',
            icon: Icons.compress_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Proteção: diodos de clamp para limitar tensão no GPIO',
            icon: Icons.shield_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
        ],
      );
    case 7:
      return const SectionTitleSlide(
        key: ValueKey(7),
        sectionNumber: '02',
        title: 'Implementação Básica',
        subtitle:
            'Cálculo RMS com float — versão didática\nSimples, mas lenta para produção',
        accentColor: Color(0xFF7C4DFF),
        icon: Icons.code_rounded,
      );
    case 8:
      return const CodeSlide(
        key: ValueKey(8),
        title: 'RMS — Versão Float',
        subtitle: 'ESP32 • Cálculo com ponto flutuante',
        accentColor: Color(0xFF7C4DFF),
        code: '''#include <Arduino.h>
#include <math.h>

#define ADC_PIN 34
#define N       1000
#define OFFSET  2048  // 12-bit ADC meio-escala

float calcRMS_float() {
  float soma = 0.0;
  for (int i = 0; i < N; i++) {
    int raw = analogRead(ADC_PIN);
    float v = (float)(raw - OFFSET);
    soma += v * v;
    delayMicroseconds(100);  // Fs = 10 kHz
  }
  return sqrt(soma / N);
}

void setup() {
  Serial.begin(115200);
  analogSetAttenuation(ADC_11db);
}

void loop() {
  float rms = calcRMS_float();
  float volts = rms * (3.3 / 4095.0);
  Serial.printf("RMS: %.1f counts (%.3f V)\\n",
                rms, volts);
  delay(500);
}''',
        explanationPoints: [
          'Subtrai offset DC (2048 para 12 bits)',
          'Soma dos quadrados com float',
          'sqrt(soma/N) = valor RMS',
          'Converte counts → Volts ao final',
          'N=1000 amostras por cálculo',
          '⚠ Float é lento no ESP32 (~14x mais lento que uint32)',
        ],
      );
    case 9:
      return const SectionTitleSlide(
        key: ValueKey(9),
        sectionNumber: '03',
        title: 'Otimizações',
        subtitle:
            'Aritmética inteira • Ponto fixo • Circular buffer\nAté 7× mais rápido que float',
        accentColor: Color(0xFF00E5FF),
        icon: Icons.speed_rounded,
      );
    case 10:
      return ContentSlide(
        key: const ValueKey(10),
        title: 'Por que Evitar Float?',
        subtitle: 'Performance em microcontroladores',
        accentColor: const Color(0xFF00E5FF),
        items: const [
          ContentItem(
            text:
                'ESP32 não tem FPU para double — apenas float (single precision)',
            icon: Icons.memory_rounded,
            iconColor: Color(0xFF00E5FF),
            isBold: true,
          ),
          ContentItem(
            text: 'Operação float: ~14 ciclos vs 1 ciclo para uint32',
            icon: Icons.speed_rounded,
            iconColor: Color(0xFFFF6B6B),
            isBold: true,
          ),
          ContentItem(
            text: 'Multiplicação int32: 1 ciclo (instrução MULL no Xtensa)',
            icon: Icons.bolt_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text:
                'sqrt() com float: ~100 ciclos — usar apenas no resultado final',
            icon: Icons.timer_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text:
                'Acumulação: usar uint64_t para somas de quadrados (evitar overflow)',
            icon: Icons.data_array_rounded,
            iconColor: Color(0xFF7C4DFF),
          ),
          ContentItem(
            text:
                'Resultado: calcRMS_inteiro é ~7× mais rápido que calcRMS_float',
            icon: Icons.trending_up_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
        ],
      );
    case 11:
      return const CodeSlide(
        key: ValueKey(11),
        title: 'RMS — Versão Inteira (Otimizada)',
        subtitle: 'ESP32 • uint64_t • sqrt apenas no final',
        accentColor: Color(0xFF00E5FF),
        code: '''#include <Arduino.h>
#include <math.h>

#define ADC_PIN 34
#define N       1000
#define OFFSET  2048

uint32_t calcRMS_inteiro() {
  uint64_t soma = 0;
  for (int i = 0; i < N; i++) {
    int32_t v = (int32_t)analogRead(ADC_PIN) - OFFSET;
    soma += (uint64_t)(v * v);  // int32 * int32
    delayMicroseconds(100);
  }
  // sqrt apenas 1 vez no final!
  return (uint32_t)sqrt((double)soma / N);
}

void setup() {
  Serial.begin(115200);
  analogSetAttenuation(ADC_11db);
}

void loop() {
  uint32_t rms = calcRMS_inteiro();
  float volts = rms * (3.3f / 4095.0f);
  Serial.printf("RMS: %u counts (%.3f V)\\n",
                rms, volts);
  delay(500);
}''',
        explanationPoints: [
          'int32_t para amostras (com sinal)',
          'uint64_t para soma (evita overflow)',
          'v*v é multiplicação inteira (1 ciclo)',
          'sqrt() chamado 1 vez (não N vezes)',
          '~7× mais rápido que versão float',
          'Mesmo resultado, menos CPU',
        ],
      );
    case 12:
      return ContentSlide(
        key: const ValueKey(12),
        title: 'Overflow — Dimensionamento',
        subtitle: 'Garantindo que a soma não transborda',
        accentColor: const Color(0xFFFF6B6B),
        items: const [
          ContentItem(
            text: 'ADC 12 bits: valor máximo = 4095, offset = 2048',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF00E5FF),
            isBold: true,
          ),
          ContentItem(
            text: 'Pior caso: v = 2048 → v² = 4.194.304 (uint32 OK)',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Soma de N=1000: 1000 × 4.194.304 = 4.194.304.000',
            icon: Icons.calculate_rounded,
          ),
          ContentItem(
            text: 'uint32 max = 4.294.967.295 → QUASE estoura com N=1000!',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'uint64 max = 1.8 × 10¹⁸ → SEGURO para qualquer N prático',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Regra: sempre use uint64_t para soma de quadrados',
            icon: Icons.rule_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text: 'Para ADC de 16 bits: uint64 é obrigatório (v² pode ser 10⁹)',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
        ],
      );
    case 13:
      return ContentSlide(
        key: const ValueKey(13),
        title: 'Circular Buffer — Sliding Window RMS',
        subtitle: 'Atualização contínua sem recalcular tudo',
        accentColor: const Color(0xFF7C4DFF),
        items: const [
          ContentItem(
            text: 'Buffer circular armazena as últimas N amostras',
            icon: Icons.loop_rounded,
            iconColor: Color(0xFF7C4DFF),
            isBold: true,
          ),
          ContentItem(
            text: 'Nova amostra: soma += novo² − antigo²',
            icon: Icons.update_rounded,
            iconColor: Color(0xFF00E5FF),
          ),
          ContentItem(
            text: 'Evita somar N valores a cada atualização',
            icon: Icons.speed_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Complexidade: O(1) por amostra (vs O(N) no método batch)',
            icon: Icons.trending_down_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text:
                'Útil para medição contínua (multímetro, display em tempo real)',
            icon: Icons.monitor_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text:
                'Cuidado: erros de arredondamento acumulam — recalcular periodicamente',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
        ],
      );
    case 14:
      return const CodeSlide(
        key: ValueKey(14),
        title: 'Circular Buffer — Código',
        subtitle: 'ESP32 • Sliding window O(1)',
        accentColor: Color(0xFF7C4DFF),
        code: '''#define N 256  // potência de 2 (otimização)
#define MASK (N - 1)

int16_t buffer[N];
uint64_t somaQ = 0;
uint16_t idx = 0;
bool cheio = false;

uint32_t updateRMS(int16_t novaAmostra) {
  if (cheio) {
    int16_t antigo = buffer[idx];
    somaQ -= (uint64_t)(antigo * antigo);
  }
  buffer[idx] = novaAmostra;
  somaQ += (uint64_t)(novaAmostra * novaAmostra);
  idx = (idx + 1) & MASK;  // mod por bitmask
  if (idx == 0) cheio = true;
  uint16_t count = cheio ? N : idx;
  return (uint32_t)sqrt((double)somaQ / count);
}''',
        explanationPoints: [
          'Buffer de tamanho N (potência de 2)',
          'Subtrai quadrado antigo, soma novo',
          'idx & MASK = módulo sem divisão',
          'O(1) por amostra, sqrt 1× por chamada',
          'N=256: cobre ~25ms a 10kHz (2+ ciclos de 60Hz)',
          'Recalcular somaQ periodicamente para evitar drift',
        ],
      );
    case 15:
      return ContentSlide(
        key: const ValueKey(15),
        title: 'Ponto Fixo Q15',
        subtitle: 'Máxima performance sem float',
        accentColor: const Color(0xFF00E5FF),
        items: const [
          ContentItem(
            text: 'Q15: 1 bit sinal + 15 bits fração (range: -1.0 a +0.9999)',
            icon: Icons.precision_manufacturing_rounded,
            iconColor: Color(0xFF00E5FF),
            isBold: true,
          ),
          ContentItem(
            text:
                'Multiplicação Q15 × Q15 → Q30: shift right 15 para voltar a Q15',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF7C4DFF),
          ),
          ContentItem(
            text: 'Acumulação em Q30 (int32): soma sem perda de precisão',
            icon: Icons.data_array_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Conversão: adc_q15 = (adc - offset) << 3 (se ADC 12-bit)',
            icon: Icons.transform_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'isqrt (raiz inteira): Newton-Raphson em inteiro',
            icon: Icons.functions_rounded,
          ),
          ContentItem(
            text:
                'Resultado: ~14× mais rápido que float em microcontroladores sem FPU',
            icon: Icons.trending_up_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Usado em DSP, filtros digitais e processamento de áudio',
            icon: Icons.graphic_eq_rounded,
            iconColor: Color(0xFF7C4DFF),
          ),
        ],
      );
    case 16:
      return const SectionTitleSlide(
        key: ValueKey(16),
        sectionNumber: '04',
        title: 'Amostragem e Nyquist',
        subtitle: 'Garantindo medição correta do sinal\nFs ≥ 2 × fmax',
        accentColor: Color(0xFF00E5FF),
        icon: Icons.waves_rounded,
      );
    case 17:
      return ContentSlide(
        key: const ValueKey(17),
        title: 'Teorema de Nyquist — Amostragem',
        subtitle: 'Frequência mínima para reconstrução do sinal',
        accentColor: const Color(0xFF00E5FF),
        items: const [
          ContentItem(
            text: 'Nyquist: Fs ≥ 2 × fmax para evitar aliasing',
            icon: Icons.waves_rounded,
            iconColor: Color(0xFF00E5FF),
            isBold: true,
          ),
          ContentItem(
            text: 'Para 60 Hz (rede): Fs ≥ 120 Hz (mínimo)',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF7C4DFF),
          ),
          ContentItem(
            text: 'Na prática: Fs ≈ 10× fmax para boa resolução',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text:
                '60 Hz: usar Fs = 600 Hz ou mais (preferencialmente 1–10 kHz)',
            icon: Icons.speed_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text:
                'Sub-amostragem: sinal aparece com frequência errada (aliasing)',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text:
                'Filtro anti-aliasing (RC passa-baixa) antes do ADC é recomendado',
            icon: Icons.filter_alt_rounded,
          ),
          ContentItem(
            text:
                'N amostras devem cobrir pelo menos 1 ciclo completo: N ≥ Fs/f',
            icon: Icons.rule_rounded,
            iconColor: Color(0xFF00E5FF),
          ),
        ],
      );
    case 18:
      return ContentSlide(
        key: const ValueKey(18),
        title: 'Janela de Medição',
        subtitle: 'Quantas amostras para resultado preciso?',
        accentColor: const Color(0xFF7C4DFF),
        items: const [
          ContentItem(
            text: 'Para 60 Hz: 1 ciclo = 16.67 ms',
            icon: Icons.timer_rounded,
            iconColor: Color(0xFF00E5FF),
          ),
          ContentItem(
            text: 'Fs = 10 kHz: N = 167 amostras por ciclo',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF7C4DFF),
          ),
          ContentItem(
            text: 'Ciclo incompleto → erro no RMS (viés no cálculo)',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text: 'Solução 1: N múltiplo do número de amostras por ciclo',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Solução 2: usar muitos ciclos (N grande) para diluir o erro',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Solução 3: sincronizar com zero-crossing do sinal',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text:
                'Típico: N = 1000 amostras a 10 kHz = 100 ms (~6 ciclos de 60 Hz)',
            icon: Icons.rule_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
        ],
      );
    case 19:
      return const SectionTitleSlide(
        key: ValueKey(19),
        sectionNumber: '05',
        title: 'Calibração e Precisão',
        subtitle:
            'Melhorando a qualidade da medição\nCorreções de offset, ganho e linearidade',
        accentColor: Color(0xFF7C4DFF),
        icon: Icons.tune_rounded,
      );
    case 20:
      return ContentSlide(
        key: const ValueKey(20),
        title: 'Calibração do ADC',
        subtitle: 'Corrigindo erros sistemáticos',
        accentColor: const Color(0xFF7C4DFF),
        items: const [
          ContentItem(
            text: 'Erro de offset: leitura ≠ 0 quando entrada = 0V',
            icon: Icons.vertical_align_bottom_rounded,
            iconColor: Color(0xFFFF6B6B),
            isBold: true,
          ),
          ContentItem(
            text: 'Erro de ganho: leitura não é proporcional (slope ≠ ideal)',
            icon: Icons.show_chart_rounded,
            iconColor: Color(0xFFF59E0B),
            isBold: true,
          ),
          ContentItem(
            text: 'Correção: Vcorrigido = (Vlido - offset) × fator_ganho',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF00E5FF),
          ),
          ContentItem(
            text:
                'Calibração 2 pontos: medir em 0V e Vref → calcular offset e ganho',
            icon: Icons.tune_rounded,
            iconColor: Color(0xFF7C4DFF),
          ),
          ContentItem(
            text: 'esp_adc_cal: biblioteca ESP-IDF para calibração de fábrica',
            icon: Icons.factory_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Multisampling: média de K leituras reduz ruído por √K',
            icon: Icons.layers_rounded,
          ),
          ContentItem(
            text: '⚠ ADC2 é afetado pelo WiFi — preferir ADC1 para medições',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
        ],
      );
    case 21:
      return const SectionTitleSlide(
        key: ValueKey(21),
        sectionNumber: '06',
        title: 'Aplicações Práticas',
        subtitle: 'Voltímetro AC, medição de potência e mais',
        accentColor: Color(0xFF00E5FF),
        icon: Icons.devices_rounded,
      );
    case 22:
      return CardsSlide(
        key: const ValueKey(22),
        title: 'Aplicações de RMS',
        subtitle: 'Medições industriais e instrumentação',
        accentColor: const Color(0xFF00E5FF),
        crossAxisCount: 3,
        cards: const [
          InfoCardData(
            title: 'Voltímetro AC',
            description:
                'True RMS para qualquer forma de onda — não assume senoide pura.',
            icon: Icons.straighten_rounded,
            color: Color(0xFF00E5FF),
          ),
          InfoCardData(
            title: 'Medidor de Potência',
            description:
                'P = Vrms × Irms × cos(φ) — potência ativa em circuitos AC.',
            icon: Icons.bolt_rounded,
            color: Color(0xFFF59E0B),
          ),
          InfoCardData(
            title: 'THD (Distorção)',
            description:
                'Análise de qualidade do sinal — harmônicos vs fundamental.',
            icon: Icons.graphic_eq_rounded,
            color: Color(0xFF7C4DFF),
          ),
          InfoCardData(
            title: 'Proteção',
            description:
                'Detecção de sobretensão/sobrecorrente para desligamento seguro.',
            icon: Icons.shield_rounded,
            color: Color(0xFFFF6B6B),
          ),
          InfoCardData(
            title: 'Audio Level',
            description: 'VU meter e medidor de nível sonoro (dB SPL).',
            icon: Icons.volume_up_rounded,
            color: Color(0xFF00D4AA),
          ),
          InfoCardData(
            title: 'Vibração',
            description:
                'RMS de aceleração para diagnóstico de máquinas rotativas.',
            icon: Icons.vibration_rounded,
            color: Color(0xFF34D399),
          ),
        ],
      );
    case 23:
      return const CodeSlide(
        key: ValueKey(23),
        title: 'Voltímetro AC — Projeto Completo',
        subtitle: 'ESP32 • ADC + RMS + Display Serial',
        accentColor: Color(0xFF00E5FF),
        code: '''#include <Arduino.h>
#include <math.h>

#define ADC_PIN    34
#define N          1000
#define FS         10000.0f
#define VREF       3.3f
#define ADC_MAX    4095.0f
#define DIVISOR    11.0f  // Divisor resistivo

volatile uint64_t somaQ = 0;
volatile uint16_t contagem = 0;

// Timer ISR — amostragem precisa
hw_timer_t* timer = NULL;

void IRAM_ATTR onTimer() {
  int32_t v = analogRead(ADC_PIN) - 2048;
  somaQ += (uint64_t)(v * v);
  contagem++;
}

void setup() {
  Serial.begin(115200);
  analogSetAttenuation(ADC_11db);
  timer = timerBegin(0, 80, true); // 1 MHz
  timerAttachInterrupt(timer, &onTimer, true);
  timerAlarmWrite(timer, 100, true); // 10 kHz
  timerAlarmEnable(timer);
}

void loop() {
  if (contagem >= N) {
    noInterrupts();
    uint64_t s = somaQ;
    somaQ = 0; contagem = 0;
    interrupts();
    float rms = sqrt((double)s / N);
    float volts = rms * VREF / ADC_MAX * DIVISOR;
    Serial.printf("Vrms: %.2f V\\n", volts);
  }
  delay(100);
}''',
        explanationPoints: [
          'Timer ISR garante Fs = 10 kHz preciso',
          'Acumulação em uint64_t na ISR',
          'sqrt() apenas 1× no resultado',
          'noInterrupts() protege variáveis compartilhadas',
          'Divisor resistivo × DIVISOR para tensão real',
          'N=1000: janela de 100ms (~6 ciclos de 60Hz)',
        ],
      );
    case 24:
      return CardsSlide(
        key: const ValueKey(24),
        title: 'Troubleshooting de RMS',
        subtitle: 'Problemas comuns e soluções',
        accentColor: const Color(0xFFFF6B6B),
        crossAxisCount: 2,
        cards: const [
          InfoCardData(
            title: 'RMS sempre zero',
            description:
                'Offset errado — medir valor médio do ADC sem sinal e usar como OFFSET.',
            icon: Icons.exposure_zero_rounded,
            color: Color(0xFFFF6B6B),
          ),
          InfoCardData(
            title: 'RMS instável',
            description:
                'Janela não cobre ciclos completos — ajustar N para múltiplo de amostras/ciclo.',
            icon: Icons.ssid_chart_rounded,
            color: Color(0xFFF59E0B),
          ),
          InfoCardData(
            title: 'Valor muito alto',
            description:
                'Ruído no ADC — adicionar capacitor 100nF no pino, usar multisampling.',
            icon: Icons.trending_up_rounded,
            color: Color(0xFF7C4DFF),
          ),
          InfoCardData(
            title: 'Overflow na soma',
            description:
                'Usar uint64_t para soma de quadrados. uint32 estoura com N > ~1000.',
            icon: Icons.memory_rounded,
            color: Color(0xFF00E5FF),
          ),
        ],
      );
    case 25:
      return CardsSlide(
        key: const ValueKey(25),
        title: 'Resumo e Próximos Passos',
        subtitle: 'Dominou o cálculo RMS otimizado na ESP32',
        accentColor: const Color(0xFF00E5FF),
        crossAxisCount: 3,
        cards: const [
          InfoCardData(
            title: 'Fórmula',
            description: 'Vrms = √(Σx²/N) — elevar, somar, dividir, raiz.',
            icon: Icons.calculate_rounded,
            color: Color(0xFF00E5FF),
          ),
          InfoCardData(
            title: 'Inteiro > Float',
            description:
                'uint64 para soma, sqrt 1×, ~7× mais rápido. Evite float no loop.',
            icon: Icons.speed_rounded,
            color: Color(0xFF7C4DFF),
          ),
          InfoCardData(
            title: 'Circular Buffer',
            description:
                'O(1) por amostra. Sliding window para medição contínua.',
            icon: Icons.loop_rounded,
            color: Color(0xFF00D4AA),
          ),
          InfoCardData(
            title: 'Offset DC',
            description: 'Subtrair meio-escala ADC. Calibrar com sinal zero.',
            icon: Icons.tune_rounded,
            color: Color(0xFFF59E0B),
          ),
          InfoCardData(
            title: 'Nyquist',
            description: 'Fs ≥ 2×fmax. Na prática: 10× para boa resolução.',
            icon: Icons.waves_rounded,
            color: Color(0xFFFF6B6B),
          ),
          InfoCardData(
            title: 'Próxima Aula',
            description:
                'Processamento Digital de Sinais — filtros e FFT na ESP32.',
            icon: Icons.arrow_forward_rounded,
            color: Color(0xFF34D399),
          ),
        ],
      );
    default:
      return Center(
        key: ValueKey(index),
        child: Text(
          'Slide ${index + 1}',
          style: const TextStyle(color: Colors.white38, fontSize: 22),
        ),
      );
  }
}
