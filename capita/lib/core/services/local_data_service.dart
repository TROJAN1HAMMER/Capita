import '../models/track.dart';
import '../models/module.dart';

class LocalDataService {
  final List<Track> _tracks = [];

  Future<void> loadMockData() async {
    // This simulates reading from local JSON or embedded SRS content.
    _tracks.clear();

    _tracks.add(
      Track(
        id: 'track_personal',
        title: 'Personal Finance',
        subtitle: 'Money, budgeting, investing, personal planning',
        icon: 'assets/icons/personal.png',
        modules: [
          Module(
            id: 'pf_m1',
            title: 'Money & Banking Basics',
            description: 'Cash, digital, UPI, banking system in India.',
            order: 1,
            estimatedTime: const Duration(minutes: 12),
            questions: [
              'What does UPI stand for?',
              'Name two types of bank accounts.',
              'What is the role of RBI?',
            ],
          ),
          Module(
            id: 'pf_m2',
            title: 'Budgeting & Savings',
            description: '50-30-20, emergency funds, expense tracking.',
            order: 2,
            estimatedTime: const Duration(minutes: 14),
            questions: [
              'Explain the 50-30-20 rule.',
              'What is an emergency fund?',
              'Name one budgeting app.',
            ],
          ),
          Module(
            id: 'pf_m3',
            title: 'Investing Basics',
            description: 'Risk vs return, mutual funds, SIPs, asset allocation.',
            order: 3,
            estimatedTime: const Duration(minutes: 15),
            questions: [
              'Define risk vs return.',
              'What is a mutual fund?',
              'Why diversify your portfolio?',
            ],
          ),
          Module(
            id: 'pf_m4',
            title: 'Credit & Loans',
            description: 'Credit score, EMI, secured vs unsecured loans.',
            order: 4,
            estimatedTime: const Duration(minutes: 12),
            questions: [
              'What is a credit score?',
              'How is EMI calculated conceptually?',
              'Give one example of a secured loan.',
            ],
          ),
          Module(
            id: 'pf_m5',
            title: 'Taxes & Compliance',
            description: 'PAN, income tax basics, Section 80C, filing returns.',
            order: 5,
            estimatedTime: const Duration(minutes: 16),
            locked: true,
            questions: [
              'What is PAN?',
              'Current 80C limit?',
              'Which form is used for salaried individuals?',
            ],
          ),
        ],
      ),
    );

    _tracks.add(
      Track(
        id: 'track_corporate',
        title: 'Corporate Finance',
        subtitle: 'Corporate finance fundamentals',
        icon: 'assets/icons/corporate.png',
        modules: [
          Module(
            id: 'cf_m1',
            title: 'Intro to Corporate Finance',
            description: 'Firm objectives, capital structure, agency problems.',
            order: 1,
            estimatedTime: const Duration(minutes: 12),
            questions: [
              'Primary goal of corporate finance?',
              'What is capital structure?',
              'Define agency problem.',
            ],
          ),
          Module(
            id: 'cf_m2',
            title: 'Financial Statements',
            description: 'Balance sheet, P&L, cash flow statement linkage.',
            order: 2,
            estimatedTime: const Duration(minutes: 14),
            questions: [
              'Balance sheet equation?',
              'Three cash flow categories?',
              'Difference between revenue and cash?',
            ],
          ),
          Module(
            id: 'cf_m3',
            title: 'Capital Budgeting',
            description: 'NPV, IRR, payback period, project selection.',
            order: 3,
            estimatedTime: const Duration(minutes: 15),
            questions: [
              'Define NPV.',
              'What does IRR represent?',
              'Payback period pros/cons?',
            ],
          ),
          Module(
            id: 'cf_m4',
            title: 'Working Capital Management',
            description: 'Inventory, receivables, CCC, liquidity.',
            order: 4,
            estimatedTime: const Duration(minutes: 13),
            questions: [
              'What is the cash conversion cycle?',
              'Two inventory valuation methods?',
              'Receivables vs payables?',
            ],
          ),
          Module(
            id: 'cf_m5',
            title: 'Cost of Capital',
            description: 'WACC, cost of debt/equity, CAPM basics.',
            order: 5,
            estimatedTime: const Duration(minutes: 16),
            locked: true,
            questions: [
              'Define WACC.',
              'Components of cost of equity?',
              'CAPM formula elements?',
            ],
          ),
        ],
      ),
    );

    // add other tracks similarly — you can generate all 8 tracks from SRS
    await Future.delayed(const Duration(milliseconds: 300));
  }

  List<Track> getAllTracks() => List.unmodifiable(_tracks);
}
